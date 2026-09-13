import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/database/tables/nutrition_tables/food_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meal_content_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meals_table.dart';
import 'package:testrun/database/tables/nutrition_tables/nutrition_log_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_quantities_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_table.dart';
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
    FoodLog,
  ],
)
class NutritionDao extends DatabaseAccessor<AppDatabase>
    with _$NutritionDaoMixin {
  NutritionDao(super.db);

  Future<int> insertFoodLog(
    MealCategory cate,
    String? path,
    String? comment,
    LogMethod logMethod,
    DateTime date,
  ) async {
    final insertion = await (into(foodLog).insert(
      FoodLogCompanion.insert(
        category: cate,
        comment: Value(comment),
        path: path != null ? Value(path) : Value(''),
        logMethod: logMethod,
        logDate: Value(date),
      ),
    ));
    return insertion;
  }

  Future<int> insertMealLog(
    MealCategory cate,
    LogMethod logMethod,
    DateTime date,
    Set<MealFood> foods,
  ) async {
    final insertion = await (into(meals).insert(
      MealsCompanion.insert(
        mealType: cate,
        logMethod: logMethod,
        date: Value(date),
      ),
    ));
    
    for (final food in foods) {
      await into(mealFoodContent).insert(
        MealFoodContentCompanion.insert(
          mealID: insertion,
          foodID: food.food.foodID,
          quantity: Value(food.quantity),
        ),
      );
    }

    return insertion;
  }

  Future<int> getDaysCalories(DateTime day) async {
    final todayMeals = await getMealsInRange(day, day.add(const Duration(days: 1)));

    final firstt = todayMeals.first;

    return firstt.getTotalCalories();
  }

  Future<DayFoods?> getYesterdayMeals() async {
    DateTime yesterday = DateUtils.dateOnly(
      DateTime.now().subtract(const Duration(days: 1)),
    );
    final logs = await (select(
      foodLog,
    )..where((l) => l.logDate.equals(yesterday))).get();
    if (logs.isEmpty) {
      return null;
    }
    return DayFoods(logs, yesterday);
  }

  void repeatFood(FoodLogData data) {
    into(foodLog).insert(
      FoodLogCompanion.insert(
        category: data.category,
        comment: Value(data.comment),
        path: Value(data.path),
        logMethod: data.logMethod,
        logDate: Value(DateTime.now()),
      ),
    );
  }

  bool isSameDate(DateTime one, DateTime other) {
    return one.year == other.year &&
        one.month == other.month &&
        one.day == other.day;
  }

  Future<Map<DateTime, DayFoods>> getFoodInRange(List<DateTime> days) async {
    // Make this into a stream
    final allFood =
        await (select(foodLog)
              ..where((f) => f.logDate.isIn(days))
              ..orderBy([(d) => OrderingTerm.desc(d.logDate)]))
            .get();
    Map<DateTime, DayFoods> foodMap = {};
    for (final foodItem in allFood) {
      DayFoods temp = DayFoods.range(foodItem, foodItem.logDate);

      foodMap.update(foodItem.logDate, (u) {
        u.foods.add(foodItem);
        return u;
      }, ifAbsent: () => temp);
    }

    return foodMap;
  }

  void testing(DateTimeRange range) async {
    final temp =
        await (select(foodLog)
              ..where(
                (f) =>
                    f.logDate.isBiggerOrEqualValue(range.start) &
                    f.logDate.isSmallerThanValue(range.end),
              )
              ..orderBy([(d) => OrderingTerm.desc(d.logDate)]))
            .get();

    for (final row in temp) {
      debugPrint(row.toString());
    }
  }

  Stream<List<FoodLogData>> findFoodInRange(DateTimeRange range) {
    final allFood =
        (select(foodLog)
              ..where(
                (f) =>
                    f.logDate.isBiggerOrEqualValue(range.start) &
                    f.logDate.isSmallerOrEqualValue(range.end),
              )
              ..orderBy([(d) => OrderingTerm.desc(d.logDate)]))
            .watch();
    // Map<DateTime, DayFoods> foodMap = {};
    // for (final foodItem in allFood) {
    //   DayFoods temp = DayFoods.range(foodItem, foodItem.logDate);

    //   foodMap.update(foodItem.logDate, (u) {
    //     u.foods.add(foodItem);
    //     return u;
    //     }, ifAbsent: () => temp);
    // }
    testing(range);

    return allFood;
  }

  Future<bool> isFiveTwoDay(DateTime start, DateTime end) async {
    final countDays = foodLog.category.count(distinct: true);
    final fasts = (selectOnly(foodLog)
      ..addColumns([countDays])
      ..where(
        foodLog.logDate.isBiggerOrEqualValue(start) &
            foodLog.logDate.isSmallerOrEqualValue(end),
      ));
    final output = await fasts.getSingle();
    return output.read(countDays)! <= 2;
  }

  Future<int> fiveTwoDayEvaluation(DateTime start) async {
    // final countDays = foodLog.category.count(distinct: true);
    // final fasts = (selectOnly(foodLog)
    //   ..addColumns([countDays])
    //   ..where(
    //     foodLog.logDate.isValue(start) &
    //         foodLog.category.isNotValue(MealCategory.snack.name),
    //   ));
    // final output = await fasts.getSingle();
    // return output.read(countDays)!;

    final allMeals =
        await (select(meals)
              ..where((f) => f.date.isBiggerOrEqualValue(start) &
                    f.date.isSmallerOrEqualValue(start.add(const Duration(days: 1))),)
              ..orderBy([(d) => OrderingTerm.desc(d.date)]))
            .get();

    final mealIDs = allMeals.map((m) => m.mealID).toList();

    int calories = 0;

    final foodContentRows = await (select(mealFoodContent).join([
      innerJoin(food, food.foodID.equalsExp(mealFoodContent.foodID)),
    ])..where(mealFoodContent.mealID.isIn(mealIDs))).get();

    for (final row in foodContentRows) {
      final foodContent = row.readTable(mealFoodContent);
      final foodItem = row.readTable(food);

      calories += foodContent.quantity * foodItem.calories.toInt();
    }

    return calories;
  }

  Future<List<int>> countMealsInRange(DateTime start, DateTime end) async {
    final countDays = foodLog.category.count(distinct: true);
    final fasts = (selectOnly(foodLog)
      ..addColumns([countDays, foodLog.logDate])
      ..where(
        foodLog.logDate.isBiggerOrEqualValue(start) &
            foodLog.logDate.isSmallerOrEqualValue(end),
      )
      ..groupBy([foodLog.logDate.date]));
    final output = await fasts.get();

    List<int> counts = [];
    for (final count in output) {
      counts.add(count.read(countDays)!);
    }
    return counts;
  }

  Future<int> addMealRecipeContent(
    int userID,
    int mealID,
    int recipeID,
    double amount,
    DateTime date,
    LogMethod logMethod,
    MealCategory cate,
  ) async {
    if (mealID < 0) {
      mealID = await insertMeal(userID, date, logMethod, cate);
      
    }

    final content = await into(mealRecipeContent).insert(
      MealRecipeContentCompanion.insert(
        mealID: mealID,
        recipeID: recipeID,
        quantity: Value(amount),
      ),
    );

    final recipeContents = await (select(
      recipeQuantities,
    )..where((q) => q.recipeID.equals(recipeID))).get();

    for (RecipeQuantity rq in recipeContents) {
      final ingredient = await (select(
        food,
      )..where((f) => f.foodID.equals(rq.foodID))).getSingle();

      insertFoodNutritionLog(userID, ingredient.foodID, amount, date);
      // double prevCarbs = ingredient.carbs;
      // double prevFat = ingredient.fat;
      // double prevProtein = ingredient.protein;
      // double prevFibre = ingredient.fibre;
      // double prevCalories = ingredient.calories;

      // (update(nutritionLog)..where((l) => l.nutritionLogID.equals(nutID)))
      //     .write(NutritionLogCompanion(carbs: Value(prevCarbs + (ingredient.carbs * amount)), fat: Value(prevFat + (ingredient.fat * amount)), protien: Value(prevProtein + (ingredient.protein * amount)), fibre: Value(prevFibre + (ingredient.fibre * amount)), calories: Value(prevCalories.toInt() + (ingredient.calories.toInt() * amount.toInt()))));
    }

    return content;
  }

  Future<int> addMealFoodContent(
    int userID,
    int mealID,
    int foodID,
    num amount,
    DateTime date,
    LogMethod logMethod,
    MealCategory cate,
  ) async {
    if (mealID < 0) {
      mealID = await insertMeal(userID, date, logMethod, cate);
    }

    final content = await into(mealFoodContent).insert(
      MealFoodContentCompanion.insert(
        mealID: mealID,
        foodID: foodID,
        quantity: Value(amount.toInt()),
      ),
    );

    insertFoodNutritionLog(userID, foodID, amount.toDouble(), date);
    return content;
  }

  Future<void> insertFoodNutritionLog(
    int userID,
    int foodID,
    double amount,
    DateTime date,
  ) async {
    final lastLog =
        await (select(nutritionLog)
              ..orderBy([(l) => OrderingTerm.desc(l.logDateTime)])
              ..limit(1))
            .getSingleOrNull();

    final curFood = await (select(
      food,
    )..where((f) => f.foodID.equals(foodID))).getSingle();

    if (lastLog != null) {
      DateTime lastDate = lastLog.logDateTime;

      if (isSameDate(lastDate, date)) {
        int nutID = lastLog.nutritionLogID;
        double prevCarbs = lastLog.carbs;
        double prevFat = lastLog.fat;
        double prevProtein = lastLog.protien;
        double prevFibre = lastLog.fibre;
        int prevCalories = lastLog.calories;

        (update(
          nutritionLog,
        )..where((l) => l.nutritionLogID.equals(nutID))).write(
          NutritionLogCompanion(
            carbs: Value(prevCarbs + (curFood.carbs * amount)),
            fat: Value(prevFat + (curFood.fat * amount)),
            protien: Value(prevProtein + (curFood.protein * amount)),
            fibre: Value(prevFibre + (curFood.fibre * amount)),
            calories: Value(
              prevCalories + (curFood.calories.toInt() * amount.toInt()),
            ),
          ),
        );
      } else {
        await into(nutritionLog).insert(
          NutritionLogCompanion.insert(
            userID: userID,
            logDateTime: Value(date),
            carbs: Value(curFood.carbs * amount),
            fat: Value(curFood.fat * amount),
            protien: Value(curFood.protein * amount),
            fibre: Value(curFood.fibre * amount),
            calories: Value(curFood.calories.toInt() * amount.toInt()),
          ),
        );
      }
    }
  }

  Future<int> insertMeal(
    int userID,
    DateTime date,
    LogMethod logMethod,
    MealCategory cate,
  ) async {
    final meal = await into(meals).insert(
      MealsCompanion.insert(
        date: Value(date),
        // inEatingWindow: Value(false),
        mealType: cate,
        logMethod: logMethod,
      ),
    );
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

  Future<List<DayMeals>> getMealsInRange(DateTime start, DateTime end) async {
    final allMeals =
        await (select(meals)
              ..where((f) => f.date.isBiggerOrEqualValue(start) &
                    f.date.isSmallerOrEqualValue(end),)
              ..orderBy([(d) => OrderingTerm.desc(d.date)]))
            .get();

    List<MealItem> mealLogs = <MealItem>[];

    final mealIDs = allMeals.map((m) => m.mealID).toList();

    Map<int, List<Ingredient>> mealFoods = {};

    final foodContentRows = await (select(mealFoodContent).join([
      innerJoin(food, food.foodID.equalsExp(mealFoodContent.foodID)),
    ])..where(mealFoodContent.mealID.isIn(mealIDs))).get();

    for (final row in foodContentRows) {
      final foodContent = row.readTable(mealFoodContent);
      final foodItem = row.readTable(food);

      final ingredient = Ingredient(
        foodItem.foodID,
        foodItem.name,
        foodItem.servingDescription,
        foodContent.quantity,
        IngredientType.food,
        foodItem.calories.toInt(),
        foodItem.fibre,
        foodItem.fat,
        foodItem.protein,
        foodItem.carbs,
      );
      mealFoods.putIfAbsent(foodContent.mealID, () => []).add(ingredient);
    }

    // final recipeContentRows = await (select(mealRecipeContent).join([
    //   innerJoin(recipe, recipe.recipeID.equalsExp(mealRecipeContent.recipeID)),
    // ])..where(mealRecipeContent.mealID.isIn(mealIDs))).get();

    // for (final row in recipeContentRows) {
    //   final recipeContent = row.readTable(mealRecipeContent);
    //   final recipeItem = row.readTable(recipe);

    //   final recipeNutrition = await (select(recipeQuantities).join([
    //     innerJoin(food, food.foodID.equalsExp(recipeQuantities.foodID)),
    //   ])..where(recipeQuantities.recipeID.equals(recipeItem.recipeID))).get();
    //   double calories = 0, fibre = 0, fat = 0, protein = 0, carbs = 0;
    //   for (final row in recipeNutrition) {
    //     final ingr = row.readTable(food);

    //     final multiplier = recipeContent.quantity / 100;

    //     calories += ingr.calories * multiplier;
    //     fibre += ingr.fibre * multiplier;
    //     fat += ingr.fat * multiplier;
    //     protein += ingr.protein * multiplier;
    //     carbs += ingr.carbs * multiplier;
    //   }
    //   final ingredient = Ingredient(
    //     recipeItem.recipeID,
    //     recipeItem.recipeName,
    //     "temporary",
    //     recipeContent.quantity,
    //     IngredientType.recipe,
    //     calories,
    //     fibre,
    //     fat,
    //     protein,
    //     carbs,
    //   );
    //   mealFoods.putIfAbsent(recipeContent.mealID, () => []).add(ingredient);
    // }

    Map<DateTime, DayMeals> output = {};

    for (final meal in allMeals) {
      final dateKey = DateUtils.dateOnly(meal.date);
      MealItem temp = MealItem(
        meal.mealID,
        mealFoods[meal.mealID] ?? const [],
        meal.date,
        // meal.inEatingWindow,
        meal.mealType,
        meal.logMethod,
      );
      mealLogs.add(temp);
      output.update(dateKey, (day) {
        day.meals.add(temp);
        day.meals.sort();
        return day;
      }, ifAbsent: () => DayMeals([temp], dateKey));
    }

    final List<DayMeals> outMeals = output.values.toList();
    outMeals.sort();

    return outMeals;

    // return mealLogs;
  }

  Future<List<Ingredient>> tempGetSearchFood(String searchValue) async {
    final results = select(food);
    // Want id, name, serving description

    if (searchValue.isNotEmpty) {
      results.where((f) => f.name.like('$searchValue%'));
    }

    final foods = await results.get();

    final foodIDs = foods.map((f) => f.foodID).toList();
    final foodContentRows = await (select(
      food,
    )..where((f) => f.foodID.isIn(foodIDs))).get();
    List<Ingredient> output = [];

    for (final foodItem in foodContentRows) {
      output.add(
        Ingredient(
          foodItem.foodID,
          foodItem.name,
          foodItem.servingDescription,
          0,
          IngredientType.food,
          foodItem.calories.toInt(),
          foodItem.fibre,
          foodItem.fat,
          foodItem.protein,
          foodItem.carbs,
        ),
      );
    }

    return output;
  }

  // Future<List<Ingredient>> getTempRecipesForSearch(String searchValue) {
  //   final results = select(recipe);

  //   if (searchValue.isNotEmpty) {
  //     results.where((r) => r.recipeName.like('$searchValue%'));
  //   }

  //   final recipes = results.get();

  //   return results.get();
  // }

  Future<List<Ingredient>> getFoodAsIngredient(List<FoodData> foods) async {
    List<Ingredient> output = [];
    final foodIDs = foods.map((f) => f.foodID).toList();
    final foodContentRows = await (select(
      food,
    )..where((f) => f.foodID.isIn(foodIDs))).get();

    for (final foodItem in foodContentRows) {
      output.add(
        Ingredient(
          foodItem.foodID,
          foodItem.name,
          foodItem.servingDescription,
          0,
          IngredientType.food,
          foodItem.calories.toInt(),
          foodItem.fibre,
          foodItem.fat,
          foodItem.protein,
          foodItem.carbs,
        ),
      );
    }

    return output;
  }

  Future<List<FoodData>> getFoodForSearch(String searchValue) async {
    final results = select(food);
    // Want id, name, serving description

    if (searchValue.isNotEmpty) {
      results.where((f) => f.name.like('$searchValue%'));
    }
    // if (searchValue.isEmpty) {
    //   final results = await (select(food)).get();
    //   if (results.isEmpty) return List.empty();
    //   return results;
    // }
    // final results = await (select(
    //   food,
    // )..where((f) => f.name.like('%$searchValue%'))).get();
    // if (results.isEmpty) return List.empty();
    return results.get();
  }

  Future<List<RecipeData>> getRecipesForSearch(String searchValue) {
    final results = select(recipe);

    if (searchValue.isNotEmpty) {
      results.where((r) => r.recipeName.like('$searchValue%'));
    }
    return results.get();
  }

  Future<List<FoodData>> getAllFood() async {
    return await (select(food)).get();
  }

  Future<void> dummyDataInsertion() async {
    final oatsID = await into(food).insert(
      FoodCompanion.insert(
        name: "Rolled Oats",
        servingDescription: "100 g",
        // servingGrams: 100,
        calories: Value(389),
        protein: Value(16.9),
        carbs: Value(66.3),
        fat: Value(6.9),
        fibre: Value(10.6),
      ),
    );

    final milkID = await into(food).insert(
      FoodCompanion.insert(
        name: "Low Fat Milk",
        servingDescription: "100 ml",
        // servingGrams: 100,
        calories: Value(42),
        protein: Value(3.4),
        carbs: Value(5),
        fat: Value(1),
        fibre: Value(0),
      ),
    );

    final chickenID = await into(food).insert(
      FoodCompanion.insert(
        name: "Chicken Breast",
        servingDescription: "100 g",
        // servingGrams: 100,
        calories: Value(165),
        protein: Value(31),
        carbs: Value(0),
        fat: Value(3.6),
        fibre: Value(0),
      ),
    );

    final riceID = await into(food).insert(
      FoodCompanion.insert(
        name: "Brown Rice",
        servingDescription: "100 g cooked",
        // servingGrams: 100,
        calories: Value(111),
        protein: Value(2.6),
        carbs: Value(23),
        fat: Value(0.9),
        fibre: Value(1.8),
      ),
    );

    final broccoliID = await into(food).insert(
      FoodCompanion.insert(
        name: "Broccoli",
        servingDescription: "100 g",
        // servingGrams: 100,
        calories: Value(35),
        protein: Value(2.4),
        carbs: Value(7),
        fat: Value(0.4),
        fibre: Value(3.3),
      ),
    );

    final bananaID = await into(food).insert(
      FoodCompanion.insert(
        name: "Banana",
        servingDescription: "1 medium",
        // servingGrams: 118,
        calories: Value(89),
        protein: Value(1.1),
        carbs: Value(22.8),
        fat: Value(0.3),
        fibre: Value(2.6),
      ),
    );

    final eggID = await into(food).insert(
      FoodCompanion.insert(
        name: "Egg",
        servingDescription: "1 large",
        // servingGrams: 50,
        calories: Value(143),
        protein: Value(13),
        carbs: Value(1.1),
        fat: Value(10),
        fibre: Value(0),
      ),
    );

    final breadID = await into(food).insert(
      FoodCompanion.insert(
        name: "Whole Wheat Bread",
        servingDescription: "1 slice",
        // servingGrams: 40,
        calories: Value(247),
        protein: Value(13),
        carbs: Value(41),
        fat: Value(4.2),
        fibre: Value(7),
      ),
    );

    final yoghurtID = await into(food).insert(
      FoodCompanion.insert(
        name: "Greek Yoghurt",
        servingDescription: "100 g",
        // servingGrams: 100,
        calories: Value(59),
        protein: Value(10),
        carbs: Value(3.6),
        fat: Value(0.4),
        fibre: Value(0),
      ),
    );

    final peanutButterID = await into(food).insert(
      FoodCompanion.insert(
        name: "Peanut Butter",
        servingDescription: "1 tbsp",
        // servingGrams: 16,
        calories: Value(588),
        protein: Value(25),
        carbs: Value(20),
        fat: Value(50),
        fibre: Value(6),
      ),
    );

    final overnightOatsID = await into(
      recipe,
    ).insert(RecipeCompanion.insert(recipeName: 'Overnight oats'));

    final chickenDonburiID = await into(
      recipe,
    ).insert(RecipeCompanion.insert(recipeName: 'Chicken Rice Bowl'));

    final eggToastID = await into(
      recipe,
    ).insert(RecipeCompanion.insert(recipeName: 'Egg Toast'));

    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: overnightOatsID,
        foodID: oatsID,
        quantity: Value(80),
      ),
    );
    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: overnightOatsID,
        foodID: milkID,
        quantity: Value(200),
      ),
    );
    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: overnightOatsID,
        foodID: bananaID,
        quantity: Value(100),
      ),
    );
    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: overnightOatsID,
        foodID: yoghurtID,
        quantity: Value(150),
      ),
    );

    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: chickenDonburiID,
        foodID: chickenID,
        quantity: Value(180),
      ),
    );
    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: chickenDonburiID,
        foodID: riceID,
        quantity: Value(200),
      ),
    );
    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: chickenDonburiID,
        foodID: broccoliID,
        quantity: Value(100),
      ),
    );

    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: eggToastID,
        foodID: eggID,
        quantity: Value(100),
      ),
    );
    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: eggToastID,
        foodID: breadID,
        quantity: Value(80),
      ),
    );
    await into(recipeQuantities).insert(
      RecipeQuantitiesCompanion.insert(
        recipeID: eggToastID,
        foodID: peanutButterID,
        quantity: Value(20),
      ),
    );
  }
}
