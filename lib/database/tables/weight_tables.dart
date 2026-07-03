import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';

class WeightLog extends Table {
  IntColumn get weightLogID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  RealColumn get amount => real().withDefault(const Constant(0))();
}
