// Food PK foodID name servingDescription servingGrams caloriesPer100g proteinPer100g carbsPer100g fatPer100g fibrePer100g

import 'package:drift/drift.dart';

@TableIndex(name: 'foodName', columns: {#name})
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

class FoodLog extends Table {
  IntColumn get foodLogID => integer().autoIncrement()();
  TextColumn get category => textEnum<MealCategory>()();
  DateTimeColumn get logDate => dateTime().withDefault(currentDate)();
  TextColumn get comment => text().nullable()();
  TextColumn get path => text().nullable()();
}

enum MealCategory {
  breakfast,
  lunch,
  supper,
  snack,
}

extension CategoryInfo on MealCategory {
  String get cardName => switch (this) {
    MealCategory.breakfast => 'Breakfast',
    MealCategory.lunch => 'Lunch',
    MealCategory.supper => 'Supper',
    MealCategory.snack => 'Snack',
  };
}