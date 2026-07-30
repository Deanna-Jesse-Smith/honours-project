import 'dart:convert';
import 'dart:math';

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
          op: GoalOperator.greaterEqual,
        ),
      ));
      //? Put something here in case they should be below a threshold? Use the operator field?
      await into(nutritionGoals).insert(
        NutritionGoalsCompanion.insert(
          goalID: Value(goalID),
          nutrientType: type,
          nutritionDailyTarget: amount,
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
          op: GoalOperator.greaterThan,
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
          op: GoalOperator.lesserEqual,
        ),
      ));
      await into(weightGoals).insert(
        WeightGoalsCompanion.insert(
          goalID: Value(goalID),
          targetWeight: target,
          startWeight: start,
        ),
      );
    });
  }

  Future<BasicStreak?> checkActiveStreak(GoalType type) {
    switch (type) {
      case GoalType.fasting:
        return checkActiveFastingStreak();
      case GoalType.weight:
        return checkActiveWeightStreak();
      case GoalType.hydration:
        return checkActiveHydrationStreak();
      case GoalType.nutrition:
        throw UnimplementedError();
    }
  }

  Future<FastingStreak?> checkActiveFastingStreak() async {
    final streakRows =
        await (select(goals).join([
                innerJoin(
                  fastingGoals,
                  fastingGoals.goalID.equalsExp(goals.goalID),
                ),
                innerJoin(streaks, streaks.streakID.equalsExp(goals.streakID)),
              ])
              ..where(streaks.endDate.isNull())
              ..where(goals.type.equalsValue(GoalType.fasting)))
            .getSingleOrNull();

    if (streakRows == null) {
      return null;
    }

    final goalRow = streakRows.readTable(goals);
    final fastingRow = streakRows.readTable(fastingGoals);
    final streakRow = streakRows.readTable(streaks);

    return FastingStreak(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      targetHours: fastingRow.targetHours,
      targetDays: fastingRow.targetDays,
      targetCalories: fastingRow.targetCalories,
      streakID: streakRow.streakID,
      type: streakRow.unlockType ?? UnlockType.badge,
      start: streakRow.startDate,
      end: streakRow.endDate,
      daysProgress: streakRow.streakProgress
    );
  }

  Future<HydrationStreak?> checkActiveHydrationStreak() async {
    final streakRows =
        await (select(goals).join([
                innerJoin(
                  hydrationGoals,
                  hydrationGoals.goalID.equalsExp(goals.goalID),
                ),
                innerJoin(streaks, streaks.streakID.equalsExp(goals.streakID)),
              ])
              ..where(streaks.endDate.isNull())
              ..where(goals.type.equalsValue(GoalType.hydration)))
            .getSingleOrNull();

    if (streakRows == null) {
      return null;
    }

    final goalRow = streakRows.readTable(goals);
    final hydrationRow = streakRows.readTable(hydrationGoals);
    final streakRow = streakRows.readTable(streaks);

    return HydrationStreak(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      hdrAmount: hydrationRow.hdrAmount,
      streakID: streakRow.streakID,
      type: streakRow.unlockType ?? UnlockType.badge,
      start: streakRow.startDate,
      end: streakRow.endDate,
      daysProgress: streakRow.streakProgress
    );
  }

  Future<WeightStreak?> checkActiveWeightStreak() async {
    final streakRows =
        await (select(goals).join([
                innerJoin(
                  weightGoals,
                  weightGoals.goalID.equalsExp(goals.goalID),
                ),
                innerJoin(streaks, streaks.streakID.equalsExp(goals.streakID)),
              ])
              ..where(streaks.endDate.isNull())
              ..where(goals.type.equalsValue(GoalType.weight)))
            .getSingleOrNull();

    if (streakRows == null) {
      return null;
    }

    final goalRow = streakRows.readTable(goals);
    final weightRow = streakRows.readTable(weightGoals);
    final streakRow = streakRows.readTable(streaks);

    return WeightStreak(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      startWeight: weightRow.startWeight,
      targetWeight: weightRow.targetWeight,
      streakID: streakRow.streakID,
      type: streakRow.unlockType ?? UnlockType.badge,
      start: streakRow.startDate,
      end: streakRow.endDate,
      daysProgress: streakRow.streakProgress
    );
  }

  Future<List<NutritionStreak?>> checkActiveNutrientStreaks() async {
    final streakRows =
        await (select(goals).join([
                innerJoin(
                  nutritionGoals,
                  nutritionGoals.goalID.equalsExp(goals.goalID),
                ),
                innerJoin(streaks, streaks.streakID.equalsExp(goals.streakID)),
              ])
              ..where(streaks.endDate.isNull())
              ..where(goals.type.equalsValue(GoalType.nutrition)))
            .get();

    List<NutritionStreak> nutritionStreaks = [];

    for (final row in streakRows) {
      final goalRow = row.readTable(goals);
      final nutritionRow = row.readTable(nutritionGoals);
      final streakRow = row.readTable(streaks);

      NutritionStreak temp = NutritionStreak(
        goalRow.goalID,
        goalRow.thresholdValue ?? 0,
        goalRow.progressValue,
        goalRow.op,
        nType: nutritionRow.nutrientType,
        dailyNutritionTarget: nutritionRow.nutritionDailyTarget,
        streakID: streakRow.streakID,
        type: streakRow.unlockType ?? UnlockType.badge,
        start: streakRow.startDate,
        end: streakRow.endDate,
      daysProgress: streakRow.streakProgress
      );
      nutritionStreaks.add(temp);
    }
    return nutritionStreaks;
  }

  Future<BasicGoal?> findActiveGoal(GoalType type) {
    switch (type) {
      case GoalType.fasting:
        return findActiveFastingGoal();
      case GoalType.weight:
        // TODO: Handle this case.
        throw UnimplementedError();
      case GoalType.hydration:
        return findActiveHydrationGoal();
      case GoalType.nutrition:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  Future<FastingGoalModel?> findActiveFastingGoal() async {
    final goalRows = await (select(goals).join([
      innerJoin(fastingGoals, fastingGoals.goalID.equalsExp(goals.goalID)),
    ])..where(goals.type.equalsValue(GoalType.fasting))..where(goals.isComplete.isValue(false))..where(goals.streakID.isNull())).getSingleOrNull();
    
    
    if (goalRows == null) {
      return null;
    }

    final goalRow = goalRows.readTable(goals);
    final fastingRow = goalRows.readTable(fastingGoals);

    return FastingGoalModel(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      targetHours: fastingRow.targetHours,
      targetDays: fastingRow.targetDays,
      targetCalories: fastingRow.targetCalories,
    );
    
  }

  Future<HydrationGoalModel?> findActiveHydrationGoal() async {
    final goalRows = await (select(goals).join([
      innerJoin(hydrationGoals, hydrationGoals.goalID.equalsExp(goals.goalID)),
    ])..where(goals.type.equalsValue(GoalType.hydration))..where(goals.isComplete.isValue(false))..where(goals.streakID.isNull())).getSingleOrNull();
    
    
    if (goalRows == null) {
      return null;
    }

    final goalRow = goalRows.readTable(goals);
    final hydrationRow = goalRows.readTable(hydrationGoals);

    return HydrationGoalModel(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      hdrAmount: hydrationRow.hdrAmount
    );
  }
}
