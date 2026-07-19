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
// Food PK foodID name servingDescription servingGrams calories protein carbs fat fibre
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
final oatsID = await into(food).insert(FoodCompanion.insert(
  name: "Rolled Oats",
  servingDescription: "100 g",
  servingGrams: 100,
  calories: Value(389),
  protein: Value(16.9),
  carbs: Value(66.3),
  fat: Value(6.9),
  fibre: Value(10.6),
));

final milkID = await into(food).insert(FoodCompanion.insert(
  name: "Low Fat Milk",
  servingDescription: "100 ml",
  servingGrams: 100,
  calories: Value(42),
  protein: Value(3.4),
  carbs: Value(5),
  fat: Value(1),
  fibre: Value(0),
));

final chickenID = await into(food).insert(FoodCompanion.insert(
  name: "Chicken Breast",
  servingDescription: "100 g",
  servingGrams: 100,
  calories: Value(165),
  protein: Value(31),
  carbs: Value(0),
  fat: Value(3.6),
  fibre: Value(0),
));

final riceID = await into(food).insert(FoodCompanion.insert(
  name: "Brown Rice",
  servingDescription: "100 g cooked",
  servingGrams: 100,
  calories: Value(111),
  protein: Value(2.6),
  carbs: Value(23),
  fat: Value(0.9),
  fibre: Value(1.8),
));

final broccoliID = await into(food).insert(FoodCompanion.insert(
  name: "Broccoli",
  servingDescription: "100 g",
  servingGrams: 100,
  calories: Value(35),
  protein: Value(2.4),
  carbs: Value(7),
  fat: Value(0.4),
  fibre: Value(3.3),
));

final bananaID = await into(food).insert(FoodCompanion.insert(
  name: "Banana",
  servingDescription: "1 medium",
  servingGrams: 118,
  calories: Value(89),
  protein: Value(1.1),
  carbs: Value(22.8),
  fat: Value(0.3),
  fibre: Value(2.6),
));

final eggID = await into(food).insert(FoodCompanion.insert(
  name: "Egg",
  servingDescription: "1 large",
  servingGrams: 50,
  calories: Value(143),
  protein: Value(13),
  carbs: Value(1.1),
  fat: Value(10),
  fibre: Value(0),
));

final breadID = await into(food).insert(FoodCompanion.insert(
  name: "Whole Wheat Bread",
  servingDescription: "1 slice",
  servingGrams: 40,
  calories: Value(247),
  protein: Value(13),
  carbs: Value(41),
  fat: Value(4.2),
  fibre: Value(7),
));

final yoghurtID = await into(food).insert(FoodCompanion.insert(
  name: "Greek Yoghurt",
  servingDescription: "100 g",
  servingGrams: 100,
  calories: Value(59),
  protein: Value(10),
  carbs: Value(3.6),
  fat: Value(0.4),
  fibre: Value(0),
));

final peanutButterID = await into(food).insert(FoodCompanion.insert(
  name: "Peanut Butter",
  servingDescription: "1 tbsp",
  servingGrams: 16,
  calories: Value(588),
  protein: Value(25),
  carbs: Value(20),
  fat: Value(50),
  fibre: Value(6),
));
  }
}
