// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_dao.dart';

// ignore_for_file: type=lint
mixin _$NutritionDaoMixin on DatabaseAccessor<AppDatabase> {
  $FoodTable get food => attachedDatabase.food;
  $RecipeTable get recipe => attachedDatabase.recipe;
  $RecipeQuantitiesTable get recipeQuantities =>
      attachedDatabase.recipeQuantities;
  $UsersTable get users => attachedDatabase.users;
  $MealsTable get meals => attachedDatabase.meals;
  $MealFoodContentTable get mealFoodContent => attachedDatabase.mealFoodContent;
  $MealRecipeContentTable get mealRecipeContent =>
      attachedDatabase.mealRecipeContent;
  $NutritionLogTable get nutritionLog => attachedDatabase.nutritionLog;
  $FoodLogTable get foodLog => attachedDatabase.foodLog;
  NutritionDaoManager get managers => NutritionDaoManager(this);
}

class NutritionDaoManager {
  final _$NutritionDaoMixin _db;
  NutritionDaoManager(this._db);
  $$FoodTableTableManager get food =>
      $$FoodTableTableManager(_db.attachedDatabase, _db.food);
  $$RecipeTableTableManager get recipe =>
      $$RecipeTableTableManager(_db.attachedDatabase, _db.recipe);
  $$RecipeQuantitiesTableTableManager get recipeQuantities =>
      $$RecipeQuantitiesTableTableManager(
        _db.attachedDatabase,
        _db.recipeQuantities,
      );
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$MealsTableTableManager get meals =>
      $$MealsTableTableManager(_db.attachedDatabase, _db.meals);
  $$MealFoodContentTableTableManager get mealFoodContent =>
      $$MealFoodContentTableTableManager(
        _db.attachedDatabase,
        _db.mealFoodContent,
      );
  $$MealRecipeContentTableTableManager get mealRecipeContent =>
      $$MealRecipeContentTableTableManager(
        _db.attachedDatabase,
        _db.mealRecipeContent,
      );
  $$NutritionLogTableTableManager get nutritionLog =>
      $$NutritionLogTableTableManager(_db.attachedDatabase, _db.nutritionLog);
  $$FoodLogTableTableManager get foodLog =>
      $$FoodLogTableTableManager(_db.attachedDatabase, _db.foodLog);
}
