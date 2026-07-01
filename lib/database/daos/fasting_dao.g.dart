// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fasting_dao.dart';

// ignore_for_file: type=lint
mixin _$FastingDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $FastLogTable get fastLog => attachedDatabase.fastLog;
  FastingDaoManager get managers => FastingDaoManager(this);
}

class FastingDaoManager {
  final _$FastingDaoMixin _db;
  FastingDaoManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$FastLogTableTableManager get fastLog =>
      $$FastLogTableTableManager(_db.attachedDatabase, _db.fastLog);
}
