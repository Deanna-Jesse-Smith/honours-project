import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';

class Reminders extends Table {
  IntColumn get reminderID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get time => dateTime().withDefault(currentDateAndTime)();
  TextColumn get days => text()();
}
