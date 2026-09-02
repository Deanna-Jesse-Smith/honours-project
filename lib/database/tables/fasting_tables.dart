import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';

class FastLog extends Table {
  IntColumn get fastLogID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  TextColumn get formIF => textEnum<FastingForm>()();
  TextColumn get earlyFastResult => textEnum<FastResult>()();
  TextColumn get lateFastResult => textEnum<FastResult>().nullable()();
  IntColumn get earlyResultSeverity => integer().withDefault(const Constant(0))();
  IntColumn get lateResultSeverity => integer().withDefault(const Constant(0))();
  DateTimeColumn get startDateTime => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get endDateTime => dateTime().nullable()();
}
