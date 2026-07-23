import 'package:drift/drift.dart';
import 'package:testrun/database/tables/goal_tables.dart';

class Reinforcements extends Table {
  IntColumn get reinID => integer().autoIncrement()();
  IntColumn get userGoalID => integer().references(UserGoalProgress, #userGoalID)();
  IntColumn get achID => integer().nullable().references(Achievements, #achID)();
  TextColumn get reinType => textEnum<ReinforcementType>()();
  TextColumn get displayContext => text().withDefault(const Constant(''))();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  // TextColumn get text => text()();
}

enum ReinforcementType {
  temp
}

class Achievements extends Table {
  IntColumn get achID => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get type => textEnum<AchievementType>()();
  TextColumn get unlockType => textEnum<UnlockType>()();
}

enum AchievementType {
  temp
}