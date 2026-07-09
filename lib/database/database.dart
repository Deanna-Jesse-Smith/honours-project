import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/daos/hydration_dao.dart';
import 'package:testrun/database/daos/nutrition_dao.dart';
import 'package:testrun/database/daos/user_dao.dart';
import 'package:testrun/database/tables/fasting_tables.dart';
import 'package:testrun/database/tables/hydration_tables.dart';
import 'package:testrun/database/tables/nutrition_tables/food_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meal_content_table.dart';
import 'package:testrun/database/tables/nutrition_tables/meals_table.dart';
import 'package:testrun/database/tables/nutrition_tables/nutrition_log_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_quantities_table.dart';
import 'package:testrun/database/tables/nutrition_tables/recipe_table.dart';
import 'package:testrun/database/tables/weight_tables.dart';

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
    MealFoodContent
  ],
  daos: [
    UserDao,
    FastingDao,
    HydrationDao,
    NutritionDao
    ]
)

class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]): super(executor ?? _openConnection());

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      // await m.createTable(Food as TableInfo<Table, dynamic>);
      // await m.createTable(Recipe as TableInfo<Table, dynamic>);
      // await m.createTable(Meals as TableInfo<Table, dynamic>);
      // await m.createTable(NutritionLog as TableInfo<Table, dynamic>);
      // await m.createTable(MealFoodContent as TableInfo<Table, dynamic>);
      // await m.createTable(MealRecipeContent as TableInfo<Table, dynamic>);
      // await m.createTable(RecipeQuantities as TableInfo<Table, dynamic>);

    await m.createTable(FastLog as TableInfo<Table, dynamic>);
    }
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'ifs',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

