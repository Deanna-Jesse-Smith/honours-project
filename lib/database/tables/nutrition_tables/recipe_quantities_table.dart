// RecipeQuantities PK (recipeID, foodID) FK recipeID FK foodID quantity

import 'package:drift/drift.dart';
import 'package:testrun/database/tables/nutrition_tables/food_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_table.dart';

class RecipeQuantities extends Table {
  IntColumn get recipeID => integer().references(Recipe, #recipeID)();
  IntColumn get foodID => integer().references(Food, #foodID)();
  RealColumn get quantity => real().withDefault(const Constant(0))();
}