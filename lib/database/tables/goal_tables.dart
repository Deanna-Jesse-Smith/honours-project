import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';

class Goals extends Table {
  IntColumn get goalID => integer().autoIncrement()();
  TextColumn get type => textEnum<GoalType>()();
  RealColumn get thresholdValue => real().nullable()();
  TextColumn get metricType => text().nullable()();
  TextColumn get op => text().nullable()();
  IntColumn get streakID => integer().nullable().references(Streaks, #streakID)();
}

class FastingGoals extends Table {
  IntColumn get goalID => integer().references(Goals, #goalID)();
  RealColumn get targetHours => real().nullable()();
  IntColumn get targetDays => integer().nullable()();
  IntColumn get targetCalories => integer().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {goalID};
}

class WeightGoals extends Table {
  IntColumn get goalID => integer().references(Goals, #goalID)();
  RealColumn get targetWeight => real().nullable()();
  RealColumn get startWeight => real().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {goalID};
}

class HydrationGoals extends Table {
  IntColumn get goalID => integer().references(Goals, #goalID)();
  IntColumn get hdrAmount => integer().nullable()();
  DateTimeColumn get hdrDate => dateTime().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {goalID};
}

class NutritionGoals extends Table {
  IntColumn get goalID => integer().references(Goals, #goalID)();
  TextColumn get nutrientType => text().nullable()();
  IntColumn get nutritionDailyTarget => integer().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {goalID};
}

enum GoalType { fasting, weight, hydration, nutrition }

class Streaks extends Table {
  IntColumn get streakID => integer().autoIncrement()();
  IntColumn get streakProgress => integer().withDefault(const Constant(0))();
  IntColumn get bestStreak => integer().withDefault(const Constant(0))();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get streakType => textEnum<StreakType>()();
  TextColumn get unlockType => textEnum<UnlockType>().nullable()();
}

enum StreakType { fasting, hydration, nutrition, weight }

enum UnlockType { badge, achievement, feature }

class UserGoalProgress extends Table {
  IntColumn get userGoalID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  IntColumn get goalID => integer().references(Goals, #goalID)();
  DateTimeColumn get dateCreated =>  dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isMain => boolean().withDefault(const Constant(false))();
  BoolColumn get isComplete => boolean().withDefault(const Constant(false))();
  RealColumn get progressValue => real().withDefault(const Constant(0))();
}