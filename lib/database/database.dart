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
import 'package:testrun/database/daos/steps_dao.dart';
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
import 'package:testrun/database/tables/steps_tables.dart';
import 'package:testrun/database/tables/weight_tables.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
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
    StepsLog,
  ],
  daos: [
    UserDao,
    FastingDao,
    HydrationDao,
    NutritionDao,
    GoalsDao,
    ReinforcementDao,
    ReminderDao,
    StepsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection()) {
    printPath();
  }

  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();

      await insertData();
    },
    onUpgrade: (m, from, to) async {
      // await m.createTable(FastLog);
    },
  );

  Future<void> insertData() async {
    await batch((batch) {
      batch.insertAll(food, [
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
      ]);
    });

    await batch((batch) {
      batch.insertAll(reinforcements, [
        ReinforcementsCompanion.insert(
          cType: ConcernType.health,
          type: Value(GoalType.fasting),
          title: 'Your fasting plan may need adjusting',
          displayContext:
              'You\'ve had difficulty maintaining your fasting schedule recently. Your routine may not fit your current lifestyle as well as it could. Consider adjusting your fasting schedule to something you can maintain more consistently.',
          citation: 'O\'Connor et al. (2022)',
          threshold: 2,
          window: 28,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.fasting),
          title: 'You\'re building a consistent fasting routine',
          displayContext:
              'Your recent fasting history shows that you\'ve been consistently following your plan. Keeping a routine that fits your lifestyle can make it easier to maintain your progress.',
          citation: 'Torres/Salisbury et al. (2022)',
          threshold: 3,
          window: 21,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.fasting),
          title: 'Your current routine is working for you',
          displayContext:
              'You\'ve been consistently following your fasting plan. Keep focusing on maintaining a routine that works for your lifestyle rather than feeling pressured to fast for longer.',
          citation: 'O\'Connor et al. (2022); O\'Neal et al. (2023)',
          threshold: 3,
          window: 28,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.health,
          type: Value(GoalType.hydration),
          title: 'Your hydration goal has been difficult to maintain',
          displayContext:
              'You haven\'t been consistently reaching your daily water goal. Consider whether changing when or how you drink water could make your goal easier to maintain.',
          citation: 'Aguiar et al. (2022)',
          threshold: 3,
          window: 7,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.hydration),
          title: 'You\'re staying consistent with your hydration goal',
          displayContext:
              'You\'ve been regularly meeting your daily water target. Keep the routine going.',
          citation: 'Aguiar et al. (2022)',
          threshold: 2,
          window: 7,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.hydration),
          title: 'Your hydration routine is becoming more consistent',
          displayContext:
              'You\'ve maintained your hydration goal across several days. Keeping the behaviour consistent can help turn it into part of your normal routine.',
          citation: 'Zhu/Wang et al. (2024)',
          threshold: 5,
          window: 14,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.health,
          type: Value(GoalType.nutrition),
          title: 'Your meal goal has been difficult to maintain',
          displayContext:
              'Your recent history shows that you haven\'t consistently reached your meal goal. Consider whether your current goal is realistic for your routine or whether it needs adjusting.',
          citation: 'Payne et al. (2022)',
          threshold: 3,
          window: 28,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.health,
          type: Value(GoalType.nutrition),
          title: 'A simpler approach may work better',
          displayContext:
              'You\'ve struggled to maintain your meal goal recently. Instead of adding more tracking consider whether your goal or logging routine could be simplified.',
          citation: 'Payne et al. (2022)',
          threshold: 3,
          window: 42,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.nutrition),
          title: 'You\'re keeping up with your meal goal',
          displayContext:
              'You\'ve consistently reached your meal goal recently. Your regular tracking gives you useful information about your eating habits and progress.',
          citation: 'Payne et al. (2022)',
          threshold: 1,
          window: 28,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.nutrition),
          title: 'Consistency matters',
          displayContext:
              'You\'ve been consistently keeping track of your meal goal. You don\'t need to record everything in detail for your progress history to be useful.',
          citation: 'Payne et al. (2022)',
          threshold: 0,
          window: 28,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.weight),
          title: 'You\'re keeping track of your progress',
          displayContext:
              'Regularly recording your weight gives you feedback about how your habits are affecting your progress toward your goal.',
          citation: 'Hallock et al. (2024)',
          threshold: 4,
          window: 28,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.fasting),
          title: 'Fast completed',
          displayContext:
              'You completed your planned fast. Take a moment to recognise the progress you\'ve made.',
          citation: 'Torres/Salisbury et al. (2022)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.fasting),
          title: 'Fast completed as planned',
          displayContext:
              'You followed your fasting plan as intended. Keeping a routine that works for you is an important part of making fasting sustainable.',
          citation: 'O\'Connor et al. (2022)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.fasting),
          title: 'Goal reached',
          displayContext:
              'You reached your fasting goal. Your progress shows what you can achieve when your plan fits your routine.',
          citation: 'Milne-Ives et al. (2023)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.hydration),
          title: 'Hydration goal reached',
          displayContext:
              'You reached your water goal today. Keep building on the routine that helped you get there.',
          citation: 'Aguiar et al. (2022)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.hydration),
          title: 'Great job staying hydrated',
          displayContext:
              'You\'ve reached your hydration target. Regular feedback like this can help reinforce the behaviours you\'re working on.',
          citation: 'Aguiar et al. (2022)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.hydration),
          title: 'Water logged',
          displayContext:
              'You logged your water intake. Keeping track of your behaviour gives you useful feedback on your progress.',
          citation: 'Milne-Ives et al. (2023)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.nutrition),
          title: 'Meal goal reached',
          displayContext:
              'You reached your meal goal. Keeping track of your meals gives you useful feedback about your eating habits.',
          citation: 'Payne et al. (2022)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.nutrition),
          title: 'Meal logged',
          displayContext:
              'You logged a meal. Keeping track of your eating behaviour can help you stay aware of your progress.',
          citation: 'Payne et al. (2022)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.nutrition),
          title: 'Goal reached',
          displayContext:
              'You reached your meal goal for today. Recognising your progress can help reinforce the behaviour.',
          citation: 'Milne-Ives et al. (2023)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.weight),
          title: 'Progress recorded',
          displayContext:
              'You\'ve recorded your weight. Keeping track of your progress gives you useful feedback about your journey toward your goal.',
          citation: 'Hallock et al. (2024)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.weight),
          title: 'Progress toward your goal',
          displayContext:
              'Your latest measurement shows you\'re moving toward your weight goal. Use this progress as feedback on how your current routine is working.',
          citation: 'Hallock et al. (2024)',
          threshold: 0,
          window: 0,
        ),
        ReinforcementsCompanion.insert(
          cType: ConcernType.pr,
          type: Value(GoalType.weight),
          title: 'Goal reached',
          displayContext:
              'You\'ve reached your weight goal. Take a moment to recognise the progress you\'ve made.',
          citation: 'Hallock et al. (2024)',
          threshold: 0,
          window: 0,
        ),
      ]);
    });

    await batch((batch) {
      batch.insertAll(fastLog, [
        FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 20, 20, 15)),
        endDateTime: Value(DateTime(2026, 6, 21, 12, 20)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.earlyStart,
        lateFastResult: Value(FastResult.lateEnd),
        startDateTime: Value(DateTime(2026, 6, 21, 19, 55)),
        endDateTime: Value(DateTime(2026, 6, 22, 12, 5)),
        earlyResultSeverity: Value(30),
        lateResultSeverity: Value(40),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.skipped,
        lateFastResult: Value(FastResult.skipped),
        startDateTime: Value(DateTime(2026, 6, 22, 20, 30)),
        endDateTime: Value(DateTime(2026, 6, 23, 12, 45)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.earlyEnd),
        startDateTime: Value(DateTime(2026, 6, 23, 20, 5)),
        endDateTime: Value(DateTime(2026, 6, 24, 11, 55)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(40),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.lateEnd,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 24, 20, 20)),
        endDateTime: Value(DateTime(2026, 6, 25, 12, 30)),
        earlyResultSeverity: Value(30),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 25, 21, 0)),
        endDateTime: Value(DateTime(2026, 6, 26, 13, 10)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.earlyStart,
        lateFastResult: Value(FastResult.lateEnd),
        startDateTime: Value(DateTime(2026, 6, 26, 20, 40)),
        endDateTime: Value(DateTime(2026, 6, 27, 12, 50)),
        earlyResultSeverity: Value(30),
        lateResultSeverity: Value(40),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.lateStart,
        lateFastResult: Value(FastResult.earlyEnd),
        startDateTime: Value(DateTime(2026, 6, 27, 20, 0)),
        endDateTime: Value(DateTime(2026, 6, 28, 12, 0)),
        earlyResultSeverity: Value(30),
        lateResultSeverity: Value(40),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.skipped,
        lateFastResult: Value(FastResult.skipped),
        startDateTime: Value(DateTime(2026, 6, 28, 20, 10)),
        endDateTime: Value(DateTime(2026, 6, 29, 12, 25)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 29, 20, 35)),
        endDateTime: Value(DateTime(2026, 6, 30, 12, 40)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 30, 20, 0)),
        endDateTime: Value(DateTime(2026, 7, 1, 12, 10)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 7, 1, 20, 20)),
        endDateTime: Value(DateTime(2026, 7, 2, 12, 30)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 7, 2, 20, 45)),
        endDateTime: Value(DateTime(2026, 7, 3, 13, 0)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 7, 3, 20, 10)),
        endDateTime: Value(DateTime(2026, 7, 4, 12, 15)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      ]);
    });
  }

  Future<void> wipeData() async {
    await transaction(() async {
      await delete(mealFoodContent).go();
      await delete(reminder).go();
      await delete(fastLog).go();
      await delete(hydrationLog).go();
      await delete(weightLog).go();
      await delete(meals).go();
      await delete(streaks).go();
      await delete(goals).go();
      await delete(fastingGoals).go();
      await delete(weightGoals).go();
      await delete(nutritionGoals).go();
      await delete(hydrationGoals).go();
      await delete(reinforcements).go();
      await delete(stepsLog).go();
      await delete(nutritionLog).go();
      await delete(foodLog).go();
      await delete(food).go();
      await delete(users).go();
    });

    await insertData();
  }

  Future<void> seedDatabase() async {
    // into(users).insert(
    //   UsersCompanion.insert(
    //     formIF: FastingForm.tre,
    //     experience: Experience.experienced,
    //     name: 'Jane Doe',
    //     typicalEatingStart: Value(DateTime(2026, 1, 1, 12, 30)),
    //     typicalEatingEnd: Value(DateTime(2026, 1, 1, 18)),
    //     adfDaysSelected: Value(''),
    //     fiveTwoDaysSelected: Value(''),
    //     height: 162,
    //   ),
    // );

    await batch((batch) {
      batch.insertAll(fastLog, [
        FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 20, 20, 15)),
        endDateTime: Value(DateTime(2026, 6, 21, 12, 20)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.earlyStart,
        lateFastResult: Value(FastResult.lateEnd),
        startDateTime: Value(DateTime(2026, 6, 21, 19, 55)),
        endDateTime: Value(DateTime(2026, 6, 22, 12, 5)),
        earlyResultSeverity: Value(30),
        lateResultSeverity: Value(40),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.skipped,
        lateFastResult: Value(FastResult.skipped),
        startDateTime: Value(DateTime(2026, 6, 22, 20, 30)),
        endDateTime: Value(DateTime(2026, 6, 23, 12, 45)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.earlyEnd),
        startDateTime: Value(DateTime(2026, 6, 23, 20, 5)),
        endDateTime: Value(DateTime(2026, 6, 24, 11, 55)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(40),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.lateEnd,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 24, 20, 20)),
        endDateTime: Value(DateTime(2026, 6, 25, 12, 30)),
        earlyResultSeverity: Value(30),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 25, 21, 0)),
        endDateTime: Value(DateTime(2026, 6, 26, 13, 10)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.earlyStart,
        lateFastResult: Value(FastResult.lateEnd),
        startDateTime: Value(DateTime(2026, 6, 26, 20, 40)),
        endDateTime: Value(DateTime(2026, 6, 27, 12, 50)),
        earlyResultSeverity: Value(30),
        lateResultSeverity: Value(40),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.lateStart,
        lateFastResult: Value(FastResult.earlyEnd),
        startDateTime: Value(DateTime(2026, 6, 27, 20, 0)),
        endDateTime: Value(DateTime(2026, 6, 28, 12, 0)),
        earlyResultSeverity: Value(30),
        lateResultSeverity: Value(40),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.skipped,
        lateFastResult: Value(FastResult.skipped),
        startDateTime: Value(DateTime(2026, 6, 28, 20, 10)),
        endDateTime: Value(DateTime(2026, 6, 29, 12, 25)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 29, 20, 35)),
        endDateTime: Value(DateTime(2026, 6, 30, 12, 40)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 6, 30, 20, 0)),
        endDateTime: Value(DateTime(2026, 7, 1, 12, 10)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 7, 1, 20, 20)),
        endDateTime: Value(DateTime(2026, 7, 2, 12, 30)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 7, 2, 20, 45)),
        endDateTime: Value(DateTime(2026, 7, 3, 13, 0)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      FastLogCompanion.insert(
        userID: 1,
        formIF: FastingForm.tre,
        earlyFastResult: FastResult.asPlanned,
        lateFastResult: Value(FastResult.asPlanned),
        startDateTime: Value(DateTime(2026, 7, 3, 20, 10)),
        endDateTime: Value(DateTime(2026, 7, 4, 12, 15)),
        earlyResultSeverity: Value(0),
        lateResultSeverity: Value(0),
      ),
      ]);
    });


  }

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
