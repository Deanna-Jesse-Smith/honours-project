// Food PK foodID name servingDescription servingGrams caloriesPer100g proteinPer100g carbsPer100g fatPer100g fibrePer100g

import 'package:drift/drift.dart';

class Food extends Table {
  IntColumn get foodID => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get servingDescription => text()();
  IntColumn get servingGrams => integer()();
  RealColumn get carbs => real().withDefault(const Constant(0))();
  RealColumn get fat => real().withDefault(const Constant(0))();
  RealColumn get protein => real().withDefault(const Constant(0))();
  RealColumn get fibre => real().withDefault(const Constant(0))();
  RealColumn get calories => real().withDefault(const Constant(0))();

}