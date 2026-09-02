// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps_dao.dart';

// ignore_for_file: type=lint
mixin _$StepsDaoMixin on DatabaseAccessor<AppDatabase> {
  $StepsLogTable get stepsLog => attachedDatabase.stepsLog;
  StepsDaoManager get managers => StepsDaoManager(this);
}

class StepsDaoManager {
  final _$StepsDaoMixin _db;
  StepsDaoManager(this._db);
  $$StepsLogTableTableManager get stepsLog =>
      $$StepsLogTableTableManager(_db.attachedDatabase, _db.stepsLog);
}
