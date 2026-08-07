import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';
import 'package:testrun/models/goals_model.dart';

@TableIndex(name: 'goal_type', columns: {#type})
class Goals extends Table {
  IntColumn get goalID => integer().autoIncrement()();
  TextColumn get type => textEnum<GoalType>()();
  RealColumn get thresholdValue => real().nullable()();
  TextColumn get metricType => textEnum<MetricType>()();
  TextColumn get op => textEnum<GoalOperator>()();
  IntColumn get streakID => integer().nullable().references(Streaks, #streakID)();
  BoolColumn get isComplete => boolean().withDefault(const Constant(false))(); // This is the completeness check for non-streak goals, that is the point of this I think
  RealColumn get progressValue => real().withDefault(const Constant(0))();
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
  RealColumn get targetWeight => real()();
  RealColumn get startWeight => real()();

  @override
  Set<Column<Object>>? get primaryKey => {goalID};
}

class HydrationGoals extends Table {
  IntColumn get goalID => integer().references(Goals, #goalID)();
  IntColumn get hdrAmount => integer().withDefault(const Constant(0))();
  DateTimeColumn get hdrDate => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {goalID};
}

class NutritionGoals extends Table {
  IntColumn get goalID => integer().references(Goals, #goalID)();
  TextColumn get nutrientType => textEnum<NutrientType>()();
  IntColumn get nutritionDailyTarget => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {goalID};
}


// @TableIndex(name: 'streak_type', columns: {#streakType})
class Streaks extends Table {
  IntColumn get streakID => integer().autoIncrement()();
  IntColumn get streakProgress => integer().withDefault(const Constant(0))();  //! Days, not individual metric checking
  // IntColumn get bestStreak => integer().withDefault(const Constant(0))();   //! calculate this in the DAO instead
  DateTimeColumn get startDate => dateTime().withDefault(currentDate)();
  DateTimeColumn get endDate => dateTime().nullable()();
  // TextColumn get streakType => textEnum<GoalType>()(); //! This doesn't really make sense to have I don't think? It's the same as GoalType, which is already stored in Goals
  TextColumn get unlockType => textEnum<UnlockType>().nullable()();
}

enum UnlockType { badge, achievement, feature }

class UserGoalProgress extends Table {
  IntColumn get userGoalID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  IntColumn get goalID => integer().references(Goals, #goalID)();
  DateTimeColumn get dateCreated =>  dateTime().withDefault(currentDate)();
  BoolColumn get isMain => boolean().withDefault(const Constant(false))();
}