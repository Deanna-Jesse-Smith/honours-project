// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydration_dao.dart';

// ignore_for_file: type=lint
mixin _$HydrationDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $HydrationLogTable get hydrationLog => attachedDatabase.hydrationLog;
  HydrationDaoManager get managers => HydrationDaoManager(this);
}

class HydrationDaoManager {
  final _$HydrationDaoMixin _db;
  HydrationDaoManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$HydrationLogTableTableManager get hydrationLog =>
      $$HydrationLogTableTableManager(_db.attachedDatabase, _db.hydrationLog);
}
