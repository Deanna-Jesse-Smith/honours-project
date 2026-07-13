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
    final start = DateTime(date.year, date.month, date.day).add(dateTimeToDuration(user.typicalEatingEnd!));
    return start;
  }

  @override
  DateTime? expectedEndFor(DateTime date, User user, DateTime? actualStart) {
    var end = DateTime(date.year, date.month, date.day).add(dateTimeToDuration(user.typicalEatingStart!));
    
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
      return WeekdayBasedCalculator(fastDurationHours: 36); // adjust to your ADF definition
    case FastingForm.fiveTwo:
      return WeekdayBasedCalculator(fastDurationHours: 24); // 5:2 typically 24hr fasting days
  }
}

class WeekdayBasedCalculator implements FastingScheduleCalculator {
  final int fastDurationHours;

  WeekdayBasedCalculator({required this.fastDurationHours});

  List<int> parseFastingDays(String raw) {
    return raw
        .split(',')
        .map((s) => int.parse(s.trim()))
        .toList();
  }

  bool isFastingDay(DateTime date, User user) {
    final fastingDays = parseFastingDays(user.adfDaysSelected);
    return fastingDays.contains(date.weekday); // DateTime.weekday: Mon=1 ... Sun=7
  }

  @override
  DateTime? expectedStartFor(DateTime date, User user) {
    if (!isFastingDay(date, user)) return null;
    return DateTime(date.year, date.month, date.day).add(dateTimeToDuration(user.typicalEatingStart!));
  }

  @override
  DateTime? expectedEndFor(DateTime date, User user, DateTime? actualStart) {
    final start = actualStart ?? expectedStartFor(date, user);
    if (start == null) return null;
    
    return start.add(Duration(hours: fastDurationHours));
  }
}

enum FastingStatus {
  notFastingDay,   // ADF rest day
  upcoming,        // more than 1hr before expected start
  startingSoon,    // within 1hr of expected start, not yet started
  overdue,         // 30+ min past expected start, not yet started
  active,          // fast in progress
  endingSoon,       // within some threshold of expected end
  completed,
}

extension FastingStatusAppearance on FastingStatus {
  String get homeReminder => switch (this) {
    FastingStatus.notFastingDay => 'Today\'s your day off',
    FastingStatus.upcoming => 'Not done',
    FastingStatus.startingSoon => 'Your fast starts soon!',
    FastingStatus.overdue => 'It\'s not too late to start now!',
    FastingStatus.active => 'You remembered!',
    FastingStatus.endingSoon => 'Almost at the finish line',
    FastingStatus.completed => 'Well done!',
  };
}

FastingStatus determineFastingStatus({
  required DateTime now,
  required User user,
  required FastLogData? activeLog,
}) {
  final today = DateTime(now.year, now.month, now.day);
  final calculator = calculatorFor(FastingFormConverter().fromSql(user.formIF));
  final expectedStart = calculator.expectedStartFor(today, user);

  if (expectedStart == null) return FastingStatus.notFastingDay;

  final expectedEnd = calculator.expectedEndFor(today, user, activeLog?.startDateTime);

  debugPrint('Status: ${DateFormat('HH:mm a').format(today)} start at ${DateFormat('HH:mm a').format(expectedStart!)} end at ${DateFormat('HH:mm a').format(expectedEnd!)}');

  if (activeLog != null) {
    if (expectedEnd != null && expectedEnd.difference(now).inMinutes <= 30) {
      return FastingStatus.endingSoon;
    }
    return FastingStatus.active;
  }

  final diff = expectedStart.difference(now);
  if (diff.inMinutes > 60) return FastingStatus.upcoming;
  if (diff.inMinutes >= -30) return FastingStatus.startingSoon;
  
  return FastingStatus.overdue;
}

// Duration _timeOfDayToDuration(TimeOfDay t) => Duration(hours: t.hour, minutes: t.minute);

Duration dateTimeToDuration(DateTime dt) => Duration(hours: dt.hour, minutes: dt.minute);

enum FastResult { //? I can have multiple of these stored maybe? Then I can show more icons in the fasting history calendar?
  asPlanned,
  lateStart,
  earlyStart,
  lateEnd,
  earlyEnd,
  skipped,
  interrupted,  // half fast in some way?
  overate,  // 5:2 specific
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
    FastResult.asPlanned => Icon(Icons.timer), // TRE
    FastResult.lateStart => Icon(Icons.sync_alt), // ADF
    FastResult.earlyStart => Icon(Icons.date_range), // 5:2
    // TODO: Handle this case.
    FastResult.lateEnd => throw UnimplementedError(),
    // TODO: Handle this case.
    FastResult.earlyEnd => throw UnimplementedError(),
    // TODO: Handle this case.
    FastResult.skipped => throw UnimplementedError(),
    // TODO: Handle this case.
    FastResult.interrupted => throw UnimplementedError(),
    // TODO: Handle this case.
    FastResult.overate => throw UnimplementedError(),
    // TODO: Handle this case.
    FastResult.underate => throw UnimplementedError(),
  };
}

class Fast {
  final DateTime start, end;
  final FastingForm form;
  final Set<FastResult> results;

  Fast({required this.start, required this.end, required this.form, required this.results});
}