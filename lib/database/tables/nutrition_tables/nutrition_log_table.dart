import 'package:drift/drift.dart';
import 'package:testrun/database/tables/user_table.dart';

class NutritionLog extends Table {
  IntColumn get nutritionLogID => integer().autoIncrement()();
  IntColumn get userID => integer().references(Users, #userID)();
  DateTimeColumn get logDateTime => dateTime().withDefault(currentDateAndTime)();
  RealColumn get carbs => real().withDefault(const Constant(0))();
  RealColumn get fat => real().withDefault(const Constant(0))();
  RealColumn get protien => real().withDefault(const Constant(0))();
  RealColumn get fibre => real().withDefault(const Constant(0))();
  IntColumn get calories => integer().withDefault(const Constant(0))();
}
