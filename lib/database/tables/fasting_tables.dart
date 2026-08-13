import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';
import 'package:testrun/models/converters.dart';

class FastLog extends Table {
  IntColumn get fastLogID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  TextColumn get formIF => textEnum<FastingForm>()();
  TextColumn get fastResult => text().withDefault(const Constant(''))();
  TextColumn get fastResultSeverity => text().withDefault(const Constant(''))();
  DateTimeColumn get startDateTime => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get endDateTime => dateTime().nullable()();
}
