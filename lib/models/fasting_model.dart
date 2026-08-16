import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/utils/Notifiers/fasting_notifier.dart';

class DummyUser {
  final DateTime start;
  final List<int> adfDaysSelected;
  final FastingForm form;
  final DateTime typicalStart, typicalEnd;

  DummyUser(this.start, this.adfDaysSelected, this.form, this.typicalStart, this.typicalEnd);
}

class FastingInterval {
  final DateTime start;
  final DateTime end;

  const FastingInterval({
    required this.start,
    required this.end,
  });

  bool contains(DateTime time) {
    return !time.isBefore(start) && time.isBefore(end);
  }

  Duration get duration => end.difference(start);
}

abstract class FastingScheduleCalculator {
  /// Returns the scheduled fasting interval associated with [date].
  ///
  /// Returns null when there is no scheduled fast for that date.
  FastingInterval? intervalFor(
    DateTime date,
    DummyUser user,
  );
}

class TRECalculator implements FastingScheduleCalculator {
  @override
  FastingInterval intervalFor(
    DateTime date,
    DummyUser user,
  ) {
    final day = DateTime(
      date.year,
      date.month,
      date.day,
    );

    final start = day.add(
      Duration(
        hours: user.typicalEnd.hour,
        minutes: user.typicalEnd.minute,
      ),
    );

    DateTime end = day.add(
      Duration(
        hours: user.typicalStart.hour,
        minutes: user.typicalStart.minute,
      ),
    );

    // Eating window crosses midnight.
    if (!end.isAfter(start)) {
      end = end.add(const Duration(days: 1));
    }

    return FastingInterval(
      start: start,
      end: end,
    );
  }
}

class WeekdayBasedCalculator implements FastingScheduleCalculator {
  final Duration fastDuration;

  const WeekdayBasedCalculator({
    required this.fastDuration,
  });

  @override
  FastingInterval? intervalFor(
    DateTime date,
    DummyUser user,
  ) {
    final dayIndex = date.weekday - 1; // Monday = 0

    if (!user.adfDaysSelected.contains(dayIndex)) {
      return null;
    }

    final day = DateTime(
      date.year,
      date.month,
      date.day,
    );

    final start = day.add(
      Duration(
        hours: user.typicalStart.hour,
        minutes: user.typicalStart.minute,
      ),
    );

    return FastingInterval(
      start: start,
      end: start.add(fastDuration),
    );
  }
}

FastingScheduleCalculator calculatorFor(FastingForm form) {
  switch (form) {
    case FastingForm.tre:
      return TRECalculator();

    case FastingForm.adf:
      return const WeekdayBasedCalculator(
        fastDuration: Duration(hours: 36),
      );

    case FastingForm.fiveTwo:
      return const WeekdayBasedCalculator(
        fastDuration: Duration(hours: 24),
      );
  }
}

FastingInterval? findRelevantInterval(
  DateTime now,
  DummyUser user,
) {
  final calculator = calculatorFor(user.form);

  final today = DateTime(
    now.year,
    now.month,
    now.day,
  );

  // Check yesterday first because its fast may still be active.
  final yesterday = today.subtract(
    const Duration(days: 1),
  );

  final yesterdayInterval = calculator.intervalFor(
    yesterday,
    user,
  );

  if (yesterdayInterval != null &&
      now.isBefore(yesterdayInterval.end)) {
    return yesterdayInterval;
  }

  return calculator.intervalFor(today, user);
}

FastingStatus determineFastingStatus({
  required DateTime now,
  required DummyUser user,
  required DateTime? activeLogStart,
}) {
  final calculator = calculatorFor(user.form);

  final interval = findRelevantInterval(
    now,
    user,
  );

  // There is no scheduled fast relevant to now.
  if (interval == null) {
    return FastingStatus.notFastingDay;
  }

  // A database log exists, so the user has actually started fasting.
  if (activeLogStart != null) {
    final remaining = interval.end.difference(now);

    if (remaining.inMinutes <= 30 && !remaining.isNegative) {
      return FastingStatus.endingSoon;
    }

    return FastingStatus.active;
  }

  // No active log: determine how close we are to the scheduled start.
  final untilStart = interval.start.difference(now);

  if (untilStart.inMinutes <= 30 && untilStart.inMinutes > 0) {
    return FastingStatus.startingSoon;
  }

  if (untilStart.inHours < 4 && untilStart.inHours > 0) {
    return FastingStatus.upcoming;
  }

  if (untilStart.isNegative) {
    return FastingStatus.overdue;
  }

  return FastingStatus.scheduled;
}

(FastResult, int) evaluateTiming(
  DateTime actual,
  DateTime expected,
  FastResult earlyResult,
  FastResult lateResult,
) {
  final difference = actual.difference(expected).inMinutes;

  if (difference.abs() <= 20) {
    return (FastResult.asPlanned, 0);
  }

  if (difference < 0) {
    return (earlyResult, difference.abs());
  }

  return (lateResult, difference);
}

enum FastingStatus {
  notFastingDay,
  upcoming,
  startingSoon,
  overdue,
  active,
  endingSoon,
  completed,
  scheduled,
}

Duration timeOfDayToDuration(TimeOfDay t) =>
    Duration(hours: t.hour, minutes: t.minute);

Duration dateTimeToDuration(DateTime dt) =>
    Duration(hours: dt.hour, minutes: dt.minute);

extension FastingStatusAppearance on FastingStatus {
  String get homeReminder => switch (this) {
    FastingStatus.notFastingDay => 'Today\'s your day off',
    FastingStatus.upcoming => 'In a while',
    FastingStatus.startingSoon => 'Your fast starts soon!',
    FastingStatus.overdue => 'It\'s not too late to start now!',
    FastingStatus.active => 'You remembered!',
    FastingStatus.endingSoon => 'Almost at the finish line',
    FastingStatus.completed => 'Well done!',
    // TODO: Handle this case.
    FastingStatus.scheduled => throw UnimplementedError(),
  };
}

enum FastResult {
  asPlanned,
  lateStart,
  earlyStart,
  lateEnd,
  earlyEnd,
  skipped,
  interrupted, // Stopped/started around the middle third of the fast
  overate, // 5:2 specific
  underate, // 5:2 specific
}

extension FastResultHistory on FastResult {
  Color get colour => switch (this) {
    FastResult.asPlanned => throw UnimplementedError(),
    FastResult.lateStart => throw UnimplementedError(),
    FastResult.earlyStart => throw UnimplementedError(),
    FastResult.lateEnd => throw UnimplementedError(),
    FastResult.earlyEnd => throw UnimplementedError(),
    FastResult.skipped => throw UnimplementedError(),
    FastResult.interrupted => throw UnimplementedError(),
    FastResult.overate => throw UnimplementedError(),
    FastResult.underate => throw UnimplementedError(),
  };

  Icon get resultIcon => switch (this) {
    FastResult.asPlanned => Icon(Icons.check),
    FastResult.lateStart => Icon(Icons.watch_later, color: Colors.deepPurple),
    FastResult.earlyStart => Icon(
      Icons.watch_later,
      color: const Color.fromARGB(255, 233, 30, 220),
    ),
    FastResult.lateEnd => Icon(Icons.stop_rounded, color: Colors.deepPurple),
    FastResult.earlyEnd => Icon(
      Icons.stop_rounded,
      color: const Color.fromARGB(255, 233, 30, 220),
    ),
    FastResult.skipped => Icon(Icons.cancel),
    FastResult.interrupted => Icon(Icons.emergency),
    FastResult.overate => Icon(Icons.filter_alt),
    FastResult.underate => Icon(Icons.filter_alt_outlined),
  };

  String get description => switch (this) {
    FastResult.asPlanned => 'This fast went according to plan',
    FastResult.lateStart => 'You started this fast over half an hour late',
    FastResult.earlyStart => 'You started this fast over half an hour early',
    FastResult.lateEnd => 'You ended this fast over half an hour late',
    FastResult.earlyEnd => 'You ended this fast over half an hour early',
    FastResult.skipped => 'You didn\'t fast on this day',
    FastResult.interrupted =>
      'This fast was interrupted part way through', //? Or maybe the user changed fasting methods in the middle of a fast?
    FastResult.overate =>
      'You ate more than was recommended on a restrictive day',
    FastResult.underate => 'You ate less than was recommended',
  };

  Row get forToolTip => .new(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [resultIcon, Text(description)],
  );
}

class Fast {
  final DateTime start, end;
  final FastingForm form;
  final Set<FastResult> results;

  Fast({
    required this.start,
    required this.end,
    required this.form,
    required this.results,
  });

  // static makeSense(List<FastLogData> list) {

  // }
}

extension FastLogDataHelper on FastLogData {
  Duration? get duration {
    if (endDateTime == null) return Duration();
    return endDateTime?.difference(startDateTime);
  }

  Set<FastResult> get results {
    List<String> strList = fastResult.split(',');
    Set<FastResult> frList = {};
    final converter = FastResultConverter();

    for (String res in strList) {
      frList.add(converter.fromSql(res));
    }
    return frList;
  }

  bool get asPlanned => results.length == 1 && results.contains(FastResult.asPlanned);
}

extension FastListHelper on List<FastLogData> {
  double get plannedRate => isEmpty ? 0 : where((f) => f.asPlanned).length / length;
  int get earlyStartCount => where((f) => f.results.contains(FastResult.earlyStart)).length;
  int get lateStartCount => where((f) => f.results.contains(FastResult.lateStart)).length;
  int get earlyEndCount => where((f) => f.results.contains(FastResult.earlyEnd)).length;
  int get lateEndCount => where((f) => f.results.contains(FastResult.lateEnd)).length;

  // 5:2 specific
  int get skippedCount => where((f) => f.results.contains(FastResult.skipped)).length;
  int get interruptedCount => where((f) => f.results.contains(FastResult.interrupted)).length;
}
