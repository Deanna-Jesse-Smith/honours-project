import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';

class Obligation extends Table {
  IntColumn get reminderID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  TextColumn get daysToTrigger => text()();
  DateTimeColumn get time => dateTime()();
}