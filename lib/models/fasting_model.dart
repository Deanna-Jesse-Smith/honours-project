import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';

abstract class FastingScheduleCalculator {
  DateTime? expectedStartFor(DateTime date, User user);
  DateTime? expectedEndFor(DateTime date, User user, DateTime? actualStart);
}

class TRECalculator implements FastingScheduleCalculator {
  @override
  DateTime? expectedStartFor(DateTime date, User user) {
    final start = DateTime(
      date.year,
      date.month,
      date.day,
    ).add(dateTimeToDuration(user.typicalEatingEnd!));
    return start;
  }

  @override
  DateTime? expectedEndFor(DateTime date, User user, DateTime? actualStart) {
    var end = DateTime(
      date.year,
      date.month,
      date.day,
    ).add(dateTimeToDuration(user.typicalEatingStart!));

    //! Add something to account for if the window goes over midnight
    if (end.isBefore(expectedStartFor(date, user)!)) {
      end = end.add(const Duration(days: 1));
    }
    return end;
  }
}

FastingScheduleCalculator calculatorFor(FastingForm form) {
  switch (form) {
    case FastingForm.tre:
      return TRECalculator();
    case FastingForm.adf:
      return WeekdayBasedCalculator(fastDurationHours: 36);
    case FastingForm.fiveTwo:
      return WeekdayBasedCalculator(fastDurationHours: 24);
  }
}

class WeekdayBasedCalculator implements FastingScheduleCalculator {
  final int fastDurationHours;

  WeekdayBasedCalculator({required this.fastDurationHours});

  List<int> parseFastingDays(String raw) {
    return raw.split(',').map((s) => int.parse(s.trim())).toList();
  }

  bool isFastingDay(DateTime date, User user) {
    final fastingDays = parseFastingDays(user.adfDaysSelected);
    return fastingDays.contains(date.weekday); // My weeks start on Monday
  }

  @override
  DateTime? expectedStartFor(DateTime date, User user) {
    if (!isFastingDay(date, user)) return null;
    return DateTime(
      date.year,
      date.month,
      date.day,
    ).add(dateTimeToDuration(user.typicalEatingStart!));
  }

  @override
  DateTime? expectedEndFor(DateTime date, User user, DateTime? actualStart) {
    final start = actualStart ?? expectedStartFor(date, user);
    if (start == null) return null;

    return start.add(Duration(hours: fastDurationHours));
  }
}

FastingStatus determineFastingStatus({
  required DateTime now,
  required User user,
  required FastLogData? activeLog,
}) {
  final today = DateTime(now.year, now.month, now.day);
  final calculator = calculatorFor(user.formIF);
  final expectedStart = calculator.expectedStartFor(now, user);

  if (expectedStart == null) return FastingStatus.notFastingDay;

  DateTime? expectedEnd = calculator.expectedEndFor(
    now,
    user,
    activeLog?.startDateTime,
  );

  debugPrint(
    'Status: ${DateFormat('HH:mm a').format(now)} start at ${DateFormat('HH:mm a').format(expectedEnd!)} end at ${DateFormat('HH:mm a').format(expectedStart!)}',
  );

  if (activeLog != null) {
    if (expectedEnd != null && expectedEnd.difference(now).inMinutes <= 30) {
      return FastingStatus.endingSoon;
    }
    return FastingStatus.active;
  }

  final diff = expectedStart.difference(now);
  debugPrint('Now - expected start = $diff');

  if (diff.inMinutes <= 30 && diff.inMinutes > 0) {
    return FastingStatus.startingSoon;
  }

  if (diff.inHours < 4 && diff.inHours > 0) {
    return FastingStatus.upcoming;
  }

  return FastingStatus.overdue;
}

enum FastingStatus {
  notFastingDay,
  upcoming,
  startingSoon,
  overdue,
  active,
  endingSoon,
  completed,
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
  };
}

enum FastResult {
  asPlanned,
  lateStart,
  earlyStart,
  lateEnd,
  earlyEnd,
  skipped,
  interrupted, // half fast in some way?
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
