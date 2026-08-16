import 'package:drift/drift.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/database/tables/user_table.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/reminder_model.dart';

class Reminder extends Table {
  IntColumn get reminderID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  TextColumn get type => textEnum<ReminderType>()();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get time => dateTime().nullable()();
  IntColumn get minutesOffset => integer().withDefault(const Constant(15))();
  TextColumn get days => text().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {userID, type},
  ];
}
