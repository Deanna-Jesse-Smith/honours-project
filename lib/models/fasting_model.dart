import 'package:flutter/material.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';

class DummyUser {
  final List<int> daysSelected;
  final FastingForm form;
  final DateTime typicalStart, typicalEnd;

  DummyUser(this.daysSelected, this.form, this.typicalStart, this.typicalEnd);
}

class FastingInterval {
  final DateTime start;
  final DateTime end;

  const FastingInterval({required this.start, required this.end});

  bool contains(DateTime time) {
    return !time.isBefore(start) && time.isBefore(end);
  }

  Duration get duration => end.difference(start);
}

abstract class FastingScheduleCalculator {
  /// Returns the scheduled fasting interval associated with [date].
  ///
  /// Returns null when there is no scheduled fast for that date.
  FastingInterval? intervalFor(DateTime date, DummyUser user);
}

class TRECalculator implements FastingScheduleCalculator {
  @override
  FastingInterval intervalFor(DateTime date, DummyUser user) {
    final day = DateTime(date.year, date.month, date.day);

    final start = day.add(
      Duration(hours: user.typicalEnd.hour, minutes: user.typicalEnd.minute),
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

    return FastingInterval(start: start, end: end);
  }
}

class WeekdayBasedCalculator implements FastingScheduleCalculator {
  const WeekdayBasedCalculator();

  @override
  FastingInterval? intervalFor(DateTime date, DummyUser user) {
    final dayIndex = date.weekday - 1; // Monday = 0

    if (!user.daysSelected.contains(dayIndex)) {
      return null;
    }

    final day = DateTime(date.year, date.month, date.day);
    late DateTime start, end;

    if (user.form == FastingForm.fiveTwo) {
      start = day;
      end = day.add(const Duration(days: 1));
    } else {
      start = day
          .subtract(const Duration(days: 1))
          .add(const Duration(hours: 20));
      end = day.add(const Duration(hours: 10));
    }

    return FastingInterval(start: start, end: end);
  }
}

FastingScheduleCalculator calculatorFor(FastingForm form) {
  switch (form) {
    case FastingForm.tre:
      return TRECalculator();
    case FastingForm.adf:
      return const WeekdayBasedCalculator();
    case FastingForm.fiveTwo:
      return const WeekdayBasedCalculator();
  }
}

FastingInterval? findRelevantInterval(
  DateTime now,
  DummyUser user, {
  DateTime? activeLogStart,
}) {
  final calculator = calculatorFor(user.form);

  final reference = activeLogStart ?? now;
  final referenceDay = DateTime(reference.year, reference.month, reference.day);

  final candidates = [
    for (var offset = -2; offset <= 2; offset++)
      referenceDay.add(Duration(days: offset)),
  ];

  FastingInterval? latestStartedInterval;

  for (final date in candidates) {
    final interval = calculator.intervalFor(date, user);
    if (interval == null) continue;

    if (activeLogStart != null) {
      if (!activeLogStart.isBefore(interval.start) &&
          activeLogStart.isBefore(interval.end)) {
        return interval;
      }

      if (!activeLogStart.isBefore(interval.start) &&
          (latestStartedInterval == null ||
              interval.start.isAfter(latestStartedInterval.start))) {
        latestStartedInterval = interval;
      }
    } else if (now.isBefore(interval.end)) {
      return interval;
    }
  }

  return latestStartedInterval;
}

/// Determines the fasting status of a user based on the current time, their fasting schedule, and any active fasting log. The function evaluates whether the user is currently fasting, has an upcoming fast, or if they should have started or ended their fast based on the defined intervals. It returns a [FastingStatus] enum value that represents the user's current fasting state.
FastingStatus determineFastingStatus({
  required DateTime now,
  required DummyUser user,
  required DateTime? activeLogStart,
}) {
  final interval = findRelevantInterval(
    now,
    user,
    activeLogStart: activeLogStart,
  );

  if (interval == null) {
    return FastingStatus.notFastingDay;
  } else if (user.form == FastingForm.fiveTwo) {
    return FastingStatus.active;
  }

  if (activeLogStart != null) {
    final remaining = interval.end.difference(now);

    if (!remaining.isNegative && remaining <= const Duration(minutes: 30)) {
      return FastingStatus.endingSoon;
    }

    if (remaining.isNegative) {
      return FastingStatus.shouldHaveEnded;
    }

    return FastingStatus.active;
  }

  final untilStart = interval.start.difference(now);

  // debugPrint('Until start: ${untilStart.inMinutes} minutes');

  if (user.form == FastingForm.adf) {
    if (untilStart > Duration.zero &&
        untilStart <= const Duration(minutes: 30)) {
      return FastingStatus.startingSoon;
    }

    if (untilStart <= Duration.zero &&
        untilStart >= const Duration(hours: -2)) {
      return FastingStatus.shouldHaveStarted;
    }

    if (untilStart > Duration.zero && untilStart <= const Duration(hours: 4)) {
      return FastingStatus.upcoming;
    }
  } else {
    if (untilStart > Duration.zero &&
        untilStart <= const Duration(minutes: 30)) {
      return FastingStatus.startingSoon;
    } else if (untilStart < Duration.zero &&
        untilStart >= const Duration(minutes: -30)) {
      return FastingStatus.shouldHaveStarted;
    } else if (untilStart > Duration.zero &&
        untilStart < const Duration(hours: 4)) {
      return FastingStatus.upcoming;
    }
  }

  if (untilStart.isNegative) {
    return FastingStatus.overdue;
  }

  return FastingStatus.scheduled;
}

enum FastingStatus {
  notFastingDay, // ADF/5:2 specific
  upcoming, // There is a fast which starts within 4 hours
  startingSoon, // Within 30 minutes before fast starts
  shouldHaveStarted, // Within 30 minutes after fast starts
  overdue, // The fast should have started over 30 minutes ago
  active, // A fast is currently active
  endingSoon, // Within 30 minutes before fast ends
  shouldHaveEnded, // Within 30 minutes after fast ends
  completed,
  scheduled, // There is a fast scheduled for today, but it is not within 4 hours of starting
}

Duration timeOfDayToDuration(TimeOfDay t) =>
    Duration(hours: t.hour, minutes: t.minute);

Duration dateTimeToDuration(DateTime dt) =>
    Duration(hours: dt.hour, minutes: dt.minute);

extension FastingStatusAppearance on FastingStatus {
  String get homeReminder => switch (this) {
    FastingStatus.notFastingDay => 'Today\'s your day off',
    FastingStatus.upcoming => 'You have a fast coming up soon',
    FastingStatus.startingSoon =>
      'Your fast starts soon, remember to eat while you can',
    FastingStatus.shouldHaveStarted => 'It\'s not too late to start your fast',
    FastingStatus.overdue => 'You should have started your fast by now',
    FastingStatus.active => 'Remember to stay hydrated during your fast',
    FastingStatus.endingSoon => 'Almost at the finish line',
    FastingStatus.completed => 'You have completed your fast for today',
    FastingStatus.scheduled => 'You have a fast scheduled for today',
    FastingStatus.shouldHaveEnded => 'You should have ended your fast by now',
  };
}

enum FastResult {
  asPlanned,
  lateStart,
  earlyStart,
  lateEnd,
  earlyEnd,
  skipped,
  interrupted, // Stopped/started around the middle third of the fast? Possibly ignore
  overate, // 5:2 specific
  underate, // 5:2 specific
}

extension FastResultHistory on FastResult {
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
    FastResult.interrupted => 'This fast was interrupted part way through',
    FastResult.overate =>
      'You ate more than was recommended on a restrictive day',
    FastResult.underate =>
      'You ate less than was recommended on a restrictive day',
  };
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
}

extension FastLogDataHelper on FastLogData {
  Color get fastFormColour => formIF.colour;

  Duration? get duration {
    if (endDateTime == null) return Duration.zero;
    return endDateTime!.difference(startDateTime);
  }

  bool get asPlanned =>
      earlyFastResult == FastResult.asPlanned &&
      lateFastResult == FastResult.asPlanned;
  bool get halfAsPlanned => 
      earlyFastResult == FastResult.asPlanned ||
      lateFastResult == FastResult.asPlanned;

  bool get wasSkipped =>
      earlyFastResult == FastResult.skipped ||
      lateFastResult == FastResult.skipped;

  bool get wasInterrupted =>
      earlyFastResult == FastResult.interrupted ||
      lateFastResult == FastResult.interrupted;
}

extension FastListHelper on List<FastLogData> {
  double get plannedRate =>
      isEmpty ? 0 : where((f) => f.asPlanned).length / length;
  double get asPlannedRate => isEmpty ? 0 : fold(0, (prev, f) => prev + (f.asPlanned ? 1 : 0)) / length;
  int get earlyStartCount =>
      where((f) => (f.earlyFastResult == FastResult.earlyStart)).length;
  int get lateStartCount =>
      where((f) => (f.earlyFastResult == FastResult.lateStart)).length;
  int get earlyEndCount =>
      where((f) => (f.lateFastResult == FastResult.earlyEnd)).length;
  int get lateEndCount =>
      where((f) => (f.lateFastResult == FastResult.lateEnd)).length;

  int get plannedEndCount =>
      where((f) => f.lateFastResult == FastResult.asPlanned).length;
  int get plannedStartCount =>
      where((f) => f.earlyFastResult == FastResult.asPlanned).length;

  int get skippedCount => where((f) => f.wasSkipped).length;
  int get interruptedCount => where((f) => f.wasInterrupted).length;

  int get overAte => where(
    (f) =>
        f.earlyFastResult == FastResult.overate ||
        f.lateFastResult == FastResult.overate,
  ).length;
  int get underAte => where(
    (f) =>
        f.earlyFastResult == FastResult.underate ||
        f.lateFastResult == FastResult.underate,
  ).length;

  double get averageEndDeviation {
    final deviations =
        where(
          (f) =>
              f.lateFastResult == FastResult.earlyEnd ||
              f.lateFastResult == FastResult.lateEnd,
        ).map(
          (f) => f.lateFastResult == FastResult.earlyEnd
              ? -f.lateResultSeverity
              : f.lateResultSeverity,
        );

    if (deviations.isEmpty) return 0;

    return deviations.reduce((a, b) => a + b) / deviations.length;
  }

  double get averageStartDeviation {
    final deviations =
        where(
          (f) =>
              f.earlyFastResult == FastResult.earlyStart ||
              f.earlyFastResult == FastResult.lateStart,
        ).map(
          (f) => f.earlyFastResult == FastResult.earlyStart
              ? -f.earlyResultSeverity
              : f.earlyResultSeverity,
        );

    if (deviations.isEmpty) return 0;

    return deviations.reduce((a, b) => a + b) / deviations.length;
  }
}
