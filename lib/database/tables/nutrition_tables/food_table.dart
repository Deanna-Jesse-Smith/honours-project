// Food PK foodID name servingDescription servingGrams caloriesPer100g proteinPer100g carbsPer100g fatPer100g fibrePer100g

import 'package:drift/drift.dart';
import 'package:testrun/models/meals_model.dart';

@TableIndex(name: 'foodName', columns: {#name})
class Food extends Table {
  IntColumn get foodID => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get servingDescription => text()();
  // IntColumn get servingGrams => integer()();
  RealColumn get carbs => real().withDefault(const Constant(0))();
  RealColumn get fat => real().withDefault(const Constant(0))();
  RealColumn get protein => real().withDefault(const Constant(0))();
  RealColumn get fibre => real().withDefault(const Constant(0))();
  RealColumn get calories => real().withDefault(const Constant(0))();
}

class FoodLog extends Table {
  IntColumn get foodLogID => integer().autoIncrement()();
  TextColumn get category => textEnum<MealCategory>()();
  DateTimeColumn get logDate => dateTime().withDefault(currentDateAndTime)();
  TextColumn get comment => text().nullable()();
  TextColumn get path => text().withDefault(const Constant(''))();
  TextColumn get logMethod => textEnum<LogMethod>()();
  RealColumn get carbs => real().withDefault(const Constant(0))();
  RealColumn get fat => real().withDefault(const Constant(0))();
  RealColumn get protein => real().withDefault(const Constant(0))();
  RealColumn get fibre => real().withDefault(const Constant(0))();
  RealColumn get calories => real().withDefault(const Constant(0))();
}