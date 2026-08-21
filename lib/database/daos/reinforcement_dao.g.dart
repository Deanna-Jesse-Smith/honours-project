// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reinforcement_dao.dart';

// ignore_for_file: type=lint
mixin _$ReinforcementDaoMixin on DatabaseAccessor<AppDatabase> {
  $ReinforcementsTable get reinforcements => attachedDatabase.reinforcements;
  $AchievementsTable get achievements => attachedDatabase.achievements;
  ReinforcementDaoManager get managers => ReinforcementDaoManager(this);
}

class ReinforcementDaoManager {
  final _$ReinforcementDaoMixin _db;
  ReinforcementDaoManager(this._db);
  $$ReinforcementsTableTableManager get reinforcements =>
      $$ReinforcementsTableTableManager(
        _db.attachedDatabase,
        _db.reinforcements,
      );
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db.attachedDatabase, _db.achievements);
}
