import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';

class FastLog extends Table {
  IntColumn get fastLogID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  TextColumn get formIF => text()();
  DateTimeColumn get startDateTime => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get endDateTime => dateTime().withDefault(currentDateAndTime)();
}
