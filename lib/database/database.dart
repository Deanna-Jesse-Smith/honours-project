import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:path_provider/path_provider.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/daos/goals_dao.dart';
import 'package:testrun/database/daos/hydration_dao.dart';
import 'package:testrun/database/daos/nutrition_dao.dart';
import 'package:testrun/database/daos/reinforcement_dao.dart';
import 'package:testrun/database/daos/reminder_dao.dart';
import 'package:testrun/database/daos/user_dao.dart';
import 'package:testrun/database/tables/fasting_tables.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/database/tables/hydration_tables.dart';
import 'package:testrun/database/tables/nutrition_tables/food_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meal_content_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meals_table.dart';
import 'package:testrun/database/tables/nutrition_tables/nutrition_log_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_quantities_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_table.dart';
import 'package:testrun/database/tables/reinforcement_tables.dart';
import 'package:testrun/database/tables/reminder_table.dart';
import 'package:testrun/database/tables/weight_tables.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/models/reminder_model.dart';
import 'package:testrun/utils/suggestions.dart';

import 'tables/user_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    FastLog,
    HydrationLog,
    WeightLog,
    Food,
    Recipe,
    Meals,
    RecipeQuantities,
    NutritionLog,
    MealRecipeContent,
    MealFoodContent,
    Goals,
    FastingGoals,
    WeightGoals, 
    HydrationGoals, 
    NutritionGoals, 
    Streaks, 
    UserGoalProgress,
    Reinforcements, 
    Achievements,
    Reminder,
    FoodLog,
  ],
  daos: [
    UserDao,
    FastingDao,
    HydrationDao,
    NutritionDao,
    GoalsDao,
    ReinforcementDao,
    ReminderDao
    ]
)

class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]): super(executor ?? _openConnection()){
    printPath();
  }

  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      // await m.createTable(FastLog);
    }
  );

  Future<void> printPath() async {
    final directory = await getApplicationSupportDirectory();
    debugPrint(directory.path);
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'ifs',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

