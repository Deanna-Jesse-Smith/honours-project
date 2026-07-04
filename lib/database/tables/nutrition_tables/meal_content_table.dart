// MealRecipeContent PK (mealID, recipeID) FK mealID FK recipeID quantity
// MealFoodContent PK (mealID, foodID) FK mealID FK foodID quantity

import 'package:drift/drift.dart';
import 'package:testrun/database/tables/nutrition_tables/food_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meals_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_table.dart';

class MealRecipeContent extends Table {
  IntColumn get mealID => integer().references(Meals, #mealID)();
  IntColumn get recipeID => integer().references(Recipe, #recipeID)();
  RealColumn get quantity => real().withDefault(const Constant(0))();
}

class MealFoodContent extends Table {
  IntColumn get mealID => integer().references(Meals, #mealID)();
  IntColumn get foodID => integer().references(Food, #foodID)();
  RealColumn get quantity => real().withDefault(const Constant(0))();
}