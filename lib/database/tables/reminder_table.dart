import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';

class Reminder extends Table {
  IntColumn get reminderID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get time => dateTime().withDefault(currentDateAndTime)();
  IntColumn get minutesOffset => integer().withDefault(const Constant(15))();
  TextColumn get days => text().nullable()();
}
