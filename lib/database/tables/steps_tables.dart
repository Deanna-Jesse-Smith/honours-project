import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';

class StepsLog extends Table {
  IntColumn get stepID => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().withDefault(currentDate)();
  IntColumn get startingStepCount => integer().withDefault(const Constant(0))();
  IntColumn get steps => integer().withDefault(const Constant(0))();
}