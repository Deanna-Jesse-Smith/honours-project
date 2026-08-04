import 'package:testrun/database/tables/goal_tables.dart';

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
  
}