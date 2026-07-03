import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';

class HydrationLog extends Table {
  IntColumn get hydrationLogID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  DateTimeColumn get logDateTime => dateTime().withDefault(currentDateAndTime)();
  RealColumn get amount => real().withDefault(const Constant(0.0))();
}
