import 'package:drift/drift.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/models/goals_model.dart';

@TableIndex(name: 'concern_type', columns: {#cType})
class Reinforcements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get cType => textEnum<ConcernType>()();
  TextColumn get type => textEnum<GoalType>()();
  TextColumn get title => text()();
  TextColumn get displayContext => text()();
  TextColumn get citation => text()();
  IntColumn get threshold => integer()();
  IntColumn get window => integer()();
  DateTimeColumn get nextEval => dateTime().nullable()();
  // TextColumn get text => text()();
}

enum ConcernType { health, pr, }

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