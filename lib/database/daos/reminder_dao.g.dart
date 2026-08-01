// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_dao.dart';

// ignore_for_file: type=lint
mixin _$ReminderDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $ReminderTable get reminder => attachedDatabase.reminder;
  ReminderDaoManager get managers => ReminderDaoManager(this);
}

class ReminderDaoManager {
  final _$ReminderDaoMixin _db;
  ReminderDaoManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$ReminderTableTableManager get reminder =>
      $$ReminderTableTableManager(_db.attachedDatabase, _db.reminder);
}
