// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reinforcement_dao.dart';

// ignore_for_file: type=lint
mixin _$ReinforcementDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $GoalsTable get goals => attachedDatabase.goals;
  $UserGoalProgressTable get userGoalProgress =>
      attachedDatabase.userGoalProgress;
  $AchievementsTable get achievements => attachedDatabase.achievements;
  $ReinforcementsTable get reinforcements => attachedDatabase.reinforcements;
  ReinforcementDaoManager get managers => ReinforcementDaoManager(this);
}

class ReinforcementDaoManager {
  final _$ReinforcementDaoMixin _db;
  ReinforcementDaoManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db.attachedDatabase, _db.goals);
  $$UserGoalProgressTableTableManager get userGoalProgress =>
      $$UserGoalProgressTableTableManager(
        _db.attachedDatabase,
        _db.userGoalProgress,
      );
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db.attachedDatabase, _db.achievements);
  $$ReinforcementsTableTableManager get reinforcements =>
      $$ReinforcementsTableTableManager(
        _db.attachedDatabase,
        _db.reinforcements,
      );
}
