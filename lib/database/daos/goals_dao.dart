import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/models/goals_model.dart';
import '../database.dart';

part 'goals_dao.g.dart';

@DriftAccessor(
  tables: [
    Goals,
    FastingGoals,
    WeightGoals,
    HydrationGoals,
    NutritionGoals,
    Streaks,
    UserGoalProgress,
  ],
)
class GoalsDao extends DatabaseAccessor<AppDatabase> with _$GoalsDaoMixin {
  GoalsDao(super.db);

  Future<void> insertNutritionGoal(
    int userID,
    NutrientType type,
    int amount,
  ) async {
    await transaction(() async {
      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.nutrition,
          thresholdValue: Value(amount.toDouble()),
          metricType: const Value('g'),
          op: const Value('>='),
        ),
      ));
      //? Put something here in case they should be below a threshold? Use the operator field?
      await into(nutritionGoals).insert(
        NutritionGoalsCompanion.insert(
          goalID: Value(goalID),
          nutrientType: type,
          nutritionDailyTarget: Value(amount),
        ),
      );
    });
  }

  Future<void> insertHydrationGoal(
    int userID,
    DateTime date,
    int amount,
  ) async {
    await transaction(() async {
      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.hydration,
          thresholdValue: Value(amount.toDouble()),
          metricType: const Value('ml'),
          op: const Value('>='),
        ),
      ));

      await into(hydrationGoals).insert(
        HydrationGoalsCompanion.insert(
          goalID: Value(goalID),
          hdrDate: Value(date),
          hdrAmount: Value(amount),
        ),
      );
    });
  }

  Future<void> insertWeightGoal(int userID, double target, double start) async {
    await transaction(() async {
      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.nutrition,
          thresholdValue: Value(target.toDouble()),
          metricType: const Value('g'),
          op: const Value('>='),
        ),
      ));
      await into(weightGoals).insert(
        WeightGoalsCompanion.insert(
          goalID: Value(goalID),
          targetWeight: Value(target),
          startWeight: Value(start),
        ),
      );
    });
  }

  Future<Goal?> checkActiveStreak(GoalType type) async {
    final streakGoals =
        await (select(goals)
              ..where(
                (g) =>
                    g.type.equalsValue(type) &
                    g.streakID.isNotNull() &
                    g.isComplete.isValue(false),
              )
              ..orderBy([
                (o) =>
                    OrderingTerm(expression: o.goalID, mode: OrderingMode.desc),
              ]))
            .get();

    final streakIDs = streakGoals.map((s) => s.goalID).toList();

    //TODO Have a check against the Streak endDate field as well
    // final streakss = select(streaks)..where((s) => s.streakID.equals(streakID) & s.streakType.equalsValue(type) & s.streakProgress.isSmallerThanValue(1) & s.endDate.isSmallerThanValue(DateTime.now()));
    //TODO use and return a StreakModel here instead
    switch (type) {
      case GoalType.fasting:
        final fastingGoalRows = await (select(fastingGoals).join([
          innerJoin(goals, nutritionGoals.goalID.equalsExp(goals.goalID)),
        ])..where(fastingGoals.goalID.isIn(streakIDs))).get();

      case GoalType.weight:
      case GoalType.hydration:
      case GoalType.nutrition:
    }

    return streakGoals.getSingleOrNull();
  }

  Future<List<NutritionStreak?>> checkActiveNutrientStreaks(
    NutrientType type,
  ) async {
    final streakRows = await (select(goals).join([
      innerJoin(nutritionGoals, nutritionGoals.goalID.equalsExp(goals.goalID)),
      innerJoin(streaks, streaks.streakID.equalsExp(goals.streakID)),
    ])).get();

    List<NutritionStreak> nutritionStreaks = [];

    for (final row in streakRows) {
      final goalRow = row.readTable(goals);
      final nutritionRow = row.readTable(nutritionGoals);
      final streakRow = row.readTable(streaks);

      NutritionStreak temp = NutritionStreak(
        goalRow.goalID,
        goalRow.thresholdValue ?? 0,
        goalRow.progressValue,
        goalRow.op ?? '',
        nType: nutritionRow.nutrientType,
        dailyNutritionTarget: nutritionRow.nutritionDailyTarget,
        streakID: streakRow.streakID,
        bestStreak: streakRow.bestStreak,
        type: streakRow.unlockType ?? UnlockType.badge,
        start: streakRow.startDate,
        end: streakRow.endDate
      );
      nutritionStreaks.add(temp);
    }
    return nutritionStreaks;
  }

  Future<BasicGoal> findActiveGoal(GoalType type) async {
    final results = select(goals)
      ..where(
        (g) =>
            g.type.equalsValue(type) &
            g.streakID.isNull() &
            g.isComplete.isValue(false),
      )
      ..orderBy([
        (o) => OrderingTerm(expression: o.goalID, mode: OrderingMode.desc),
      ]);
    return results.getSingle();
  }
}
