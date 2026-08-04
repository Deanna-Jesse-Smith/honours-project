import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/utils/user_state.dart';

const Map<GoalType, int> reminderKey = {
  GoalType.fasting: 1,
  GoalType.hydration: 2,
  GoalType.nutrition: 3,
  GoalType.weight: 4,
};

const Map<String, int> fastingTypeKey = {
  'preStartTRE': 1,
  'startTRE': 2,
  'preEndTRE': 3,
  'endTRE': 4,
  'halfTRE': 5,
  'morningADF': 6,
  'halfADF': 7,
  'morningFiveTwo': 8,
};

class CalculateReminderTimes {
  CalculateReminderTimes();

  // static TimeOfDay getTREtimes(UserSessionData session) {
  //   TimeOfDay.fromDateTime(session.startTime);
  // }
}

extension TimeOfDayToDateTime on TimeOfDay {
  DateTime get dateTimeConversion {
    DateTime today = DateTime.now();
    return DateTime(today.year, today.month, today.day, hour, minute);
  }
}