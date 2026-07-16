import 'package:drift/drift.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/database/tables/nutrition_tables/food_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meal_content_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meals_table.dart';
import 'package:testrun/database/tables/nutrition_tables/nutrition_log_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_quantities_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_table.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/meals_model.dart';

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

  Future<int> addMealRecipeContent(int userID, int mealID, int recipeID, double amount, DateTime date, LogMethod logMethod) async {
    if (mealID < 0) {
      mealID = await insertMeal(userID, date, logMethod);
      // TODO put the 'is in eating window' thing in place
    }

    final content = await into(mealRecipeContent).insert(MealRecipeContentCompanion.insert(mealID: mealID, recipeID: recipeID, quantity: Value(amount)));
    return content;
  }

    Future<int> addMealFoodContent(int userID, int mealID, int foodID, double amount, DateTime date, LogMethod logMethod) async {
    if (mealID < 0) {
      mealID = await insertMeal(userID, date, logMethod);
      // TODO put the 'is in eating window' thing in place
    }

    final content = await into(mealFoodContent).insert(MealFoodContentCompanion.insert(mealID: mealID, foodID: foodID, quantity: Value(amount)));
    return content;
  }

  Future<int> insertMeal(int userID, DateTime date, LogMethod logMethod) async {
    final meal = await into(meals).insert(MealsCompanion.insert(userID: userID, date: Value(date), inEatingWindow: Value(false), logMethod: Value(LogMethodConverter().toSql(logMethod))));
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

  Future<List<MealItem>> getMealsInRange(List<DateTime> days) async {
    final allMeals = await (select(meals)
    ..where((m) => m.date.isIn(days))
    ..orderBy([(d) => OrderingTerm.desc(d.date)])
    ).get();

    List<MealItem> mealLogs = List.empty();

    final mealIDs = allMeals.map((m) => m.mealID).toList();

    Map<int, List<Ingredient>> mealFoods = {};

    final foodContentRows = await (select(mealFoodContent)
    .join([innerJoin(food, food.foodID.equalsExp(mealFoodContent.foodID))])
    ..where(mealFoodContent.mealID.isIn(mealIDs))).get();

    for (final row in foodContentRows) {
      final foodContent = row.readTable(mealFoodContent);
      final foodItem = row.readTable(food);

      final ingredient = Ingredient(foodItem.foodID, foodItem.name, foodContent.quantity, IngredientType.food);
      mealFoods.putIfAbsent(foodContent.mealID, () => []).add(ingredient);
    }

    final recipeContentRows = await (select(mealRecipeContent)
    .join([innerJoin(recipe, recipe.recipeID.equalsExp(mealRecipeContent.recipeID))])
    ..where(mealRecipeContent.mealID.isIn(mealIDs))).get();

    for (final row in recipeContentRows) {
      final recipeContent = row.readTable(mealRecipeContent);
      final recipeItem = row.readTable(recipe);

      final ingredient = Ingredient(recipeItem.recipeID, recipeItem.recipeName, recipeContent.quantity, IngredientType.recipe);
      mealFoods.putIfAbsent(recipeContent.mealID, () => []).add(ingredient);
    }

    for (final meal in allMeals) {
      MealItem temp = MealItem(meal.mealID, mealFoods[meal.mealID], meal.date, meal.inEatingWindow, LogMethodConverter().fromSql(meal.logMethod));
      mealLogs.add(temp);
    }

    return mealLogs;
  }

  Future<List<FoodData>> getFoodForSearch(String searchValue) {
    return (select(food)).get();
  }

  Future<void> dummyDataInsertion() async {
    await into(food).insert(FoodCompanion.insert(
  name: "Rolled Oats",
  userID: 0,
  calories: Value(380),
  protein:  Value(16.9),
  carbs:  Value(66.3),
  fat:  Value(6.9),
  fibre:  Value(10.6),
));

// await into(food).insert(FoodCompanion.insert(
//   name: "Chicken Breast",
//   servingDescription: "1 fillet",
//   servingGrams: 150,
//   caloriesPer100g: 165,
//   proteinPer100g: 31,
//   carbsPer100g: 0,
//   fatPer100g: 3.6,
//   fibrePer100g: 0,
// ));

// await into(food).insert(FoodCompanion.insert(
//   name: "Brown Rice",
//   servingDescription: "1 cup cooked",
//   servingGrams: 195,
//   caloriesPer100g: 111,
//   proteinPer100g: 2.6,
//   carbsPer100g: 23,
//   fatPer100g: 0.9,
//   fibrePer100g: 1.8,
// ));

// await into(food).insert(FoodCompanion.insert(
//   name: "Apple",
//   servingDescription: "1 medium",
//   servingGrams: 182,
//   caloriesPer100g: 52,
//   proteinPer100g: 0.3,
//   carbsPer100g: 14,
//   fatPer100g: 0.2,
//   fibrePer100g: 2.4,
// ));

// await into(food).insert(FoodCompanion.insert(
//   name: "Greek Yoghurt",
//   servingDescription: "170 g tub",
//   servingGrams: 170,
//   caloriesPer100g: 59,
//   proteinPer100g: 10.3,
//   carbsPer100g: 3.6,
//   fatPer100g: 0.4,
//   fibrePer100g: 0,
// ));
  }
}
