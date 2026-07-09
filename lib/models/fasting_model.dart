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
    
    // Eating window crosses midnight (e.g. ends 20:00, starts 12:00 next day)
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
  required FastingScheduleCalculator calculator,
  required User user,
  required FastLogData? activeLog,
}) {
  final today = DateTime(now.year, now.month, now.day);
  final expectedStart = calculator.expectedStartFor(today, user);
  if (expectedStart == null) return FastingStatus.notFastingDay;

  final expectedEnd = calculator.expectedEndFor(today, user, activeLog?.startDateTime);

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