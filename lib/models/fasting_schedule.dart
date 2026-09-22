import 'package:flutter/material.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';

abstract class FastingScheduleCalculator {
  DateTime? expectedStartFor(DateTime date, DummyUser user);

  DateTime? expectedEndFor(
    DateTime date,
    DummyUser user,
    DateTime? actualStart,
  );

  DateTime? nextExpectedStartFor(DateTime date, DummyUser user);

  DateTime? nextExpectedEndFor(DateTime date, DummyUser user);
}

class TRECalculator implements FastingScheduleCalculator {
  @override
  DateTime? expectedStartFor(DateTime date, DummyUser user) {
    return DateTime(
      date.year,
      date.month,
      date.day,
    ).add(dateTimeToDuration(user.typicalStart));
  }

  @override
  DateTime? expectedEndFor(
    DateTime date,
    DummyUser user,
    DateTime? actualStart,
  ) {
    var end = DateTime(
      date.year,
      date.month,
      date.day,
    ).add(dateTimeToDuration(user.typicalEnd));

    final start = actualStart ?? expectedStartFor(date, user)!;

    if (end.isBefore(start)) {
      end = end.add(const Duration(days: 1));
    }

    return end;
  }

  @override
  DateTime? nextExpectedStartFor(DateTime date, DummyUser user) {
    final start = expectedStartFor(date, user)!;

    if (start.isAfter(date)) {
      return start;
    }

    return expectedStartFor(date.add(const Duration(days: 1)), user);
  }

  @override
  DateTime? nextExpectedEndFor(DateTime date, DummyUser user) {
    final start = nextExpectedStartFor(date, user);

    if (start == null) return null;

    return expectedEndFor(start, user, start);
  }
}

class WeekdayBasedCalculator implements FastingScheduleCalculator {
  final int fastDurationHours;

  WeekdayBasedCalculator({required this.fastDurationHours});

  List<int> parseFastingDays(String raw) {
    return raw.split(',').map((s) => int.parse(s.trim())).toList();
  }

  @override
  DateTime? expectedStartFor(DateTime date, DummyUser user) {
    if (!user.adfDaysSelected.contains(date.weekday)) return null;

    return DateTime(
      date.year,
      date.month,
      date.day,
    ).add(dateTimeToDuration(user.typicalStart));
  }

  @override
  DateTime? expectedEndFor(
    DateTime date,
    DummyUser user,
    DateTime? actualStart,
  ) {
    final start = actualStart ?? expectedStartFor(date, user);

    if (start == null) return null;

    return start.add(Duration(hours: fastDurationHours));
  }

  @override
  DateTime? nextExpectedStartFor(DateTime date, DummyUser user) {
    var candidate = date;

    // Check today first, then up to the next 7 days.
    for (var i = 0; i < 7; i++) {
      final start = expectedStartFor(candidate, user);

      if (start != null && start.isAfter(date)) {
        return start;
      }

      candidate = candidate.add(const Duration(days: 1));
    }

    return null;
  }

  @override
  DateTime? nextExpectedEndFor(DateTime date, DummyUser user) {
    final start = nextExpectedStartFor(date, user);

    if (start == null) return null;

    return expectedEndFor(start, user, start);
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

Duration timeOfDayToDuration(TimeOfDay t) =>
    Duration(hours: t.hour, minutes: t.minute);

Duration dateTimeToDuration(DateTime dt) =>
    Duration(hours: dt.hour, minutes: dt.minute);

class FastingProgress {
  final Duration remaining;
  final double percentage;

  const FastingProgress({required this.remaining, required this.percentage});
}

FastingProgress calculateFastingProgress({
  required DateTime now,
  required DummyUser user,
  required DateTime? activeStart,
}) {
  final calculator = calculatorFor(user.form);

  // Currently fasting
  if (activeStart != null) {
    final expectedEnd = calculator.expectedEndFor(now, user, activeStart);

    if (expectedEnd == null) {
      return const FastingProgress(remaining: Duration.zero, percentage: 0);
    }

    final total = expectedEnd.difference(activeStart);

    final remaining = expectedEnd.difference(now);

    final percentage = total.inSeconds <= 0
        ? 0.0
        : (remaining.inSeconds / total.inSeconds).clamp(0.0, 1.0);

    return FastingProgress(
      remaining: remaining.isNegative ? Duration.zero : remaining,
      percentage: percentage,
    );
  }

  final nextStart = calculator.nextExpectedStartFor(now, user);

  if (nextStart == null) {
    return const FastingProgress(remaining: Duration.zero, percentage: 0);
  }

  final remaining = nextStart.difference(now);

  return FastingProgress(
    remaining: remaining.isNegative ? Duration.zero : remaining,
    percentage: 1.0,
  );
}
