import 'package:drift/drift.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/database/tables/nutrition_tables/food_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meal_content_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meals_table.dart';
import 'package:testrun/database/tables/nutrition_tables/nutrition_log_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_quantities_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_table.dart';

part 'nutrition_dao.g.dart';

// Meals PK mealID FK userID mealType date time inEatingWindow logMethod
// MealFoodContent PK (mealID, foodID) FK mealID FK foodID quantity
// MealRecipeContent PK (mealID, recipeID) FK mealID FK recipeID quantity Recipe PK recipeID recipeName isFavourite
// RecipeQuantities PK (recipeID, foodID) FK recipeID FK foodID quantity
// Food PK foodID name servingDescription servingGrams caloriesPer100g proteinPer100g carbsPer100g fatPer100g fibrePer100g
// NutritionLog PK nutritionLogID FK mealID carbs fat protein fibre calories

@DriftAccessor(
  tables: [
    Food,
    Recipe,
    RecipeQuantities,
    Meals,
    MealFoodContent,
    MealRecipeContent,
    NutritionLog,
  ],
)
class NutritionDao extends DatabaseAccessor<AppDatabase>
    with _$NutritionDaoMixin {
  NutritionDao(super.db);

  Future<void> updateFoodLog(DateTime date) async {

  }

  Future<int> addMealRecipeContent(int userID, int mealID, int recipeID, double amount, DateTime date, String logMethod) async {
    if (mealID < 0) {
      mealID = await insertMeal(userID, amount, date, logMethod);
      // TODO put the 'is in eating window' thing in place
    }

    final content = await into(mealRecipeContent).insert(MealRecipeContentCompanion.insert(mealID: mealID, recipeID: recipeID, quantity: Value(amount)));
    return content;
  }

    Future<int> addMealFoodContent(int userID, int mealID, int foodID, double amount, DateTime date, String logMethod) async {
    if (mealID < 0) {
      mealID = await insertMeal(userID, amount, date, logMethod);
      // TODO put the 'is in eating window' thing in place
    }

    final content = await into(mealFoodContent).insert(MealFoodContentCompanion.insert(mealID: mealID, foodID: foodID, quantity: Value(amount)));
    return content;
  }

  Future<int> insertMeal(int userID, double amount, DateTime date, String logMethod) async {
    final meal = await into(meals).insert(MealsCompanion.insert(userID: userID, date: Value(date), inEatingWindow: Value(false), logMethod: Value(logMethod), amount: Value(amount)));
    return meal;
  }

  Future<int> insertRecipe(
    String recipeName,
    List<FoodData> ingredients,
    List<double> amounts,
  ) async {
    final newRecipe = await into(
      recipe,
    ).insert(RecipeCompanion.insert(recipeName: recipeName));
    updateRecipeQuantities(newRecipe, ingredients, amounts);
    return newRecipe;
  }

  Future<void> updateRecipeQuantities(
    int recipeID,
    List<FoodData> ingredients,
    List<double> amounts,
  ) async {
    for (int loop = 0; loop < ingredients.length; loop++) {
      var foodItem = ingredients[loop];
      // (update(recipeQuantities)..where((r) => r.recipeID.equals(recipeID))).write(Recipe);
      final foodID = await (select(
        food,
      )..where((f) => f.foodID.equals(foodItem.foodID))).getSingle();
      into(recipeQuantities).insert(
        RecipeQuantitiesCompanion.insert(
          recipeID: recipeID,
          foodID: foodID.foodID,
          quantity: Value(amounts[loop]),
        ),
      );
    }
  }
}
