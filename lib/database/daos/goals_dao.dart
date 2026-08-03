import 'dart:convert';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  Future<void> insertNutritionStreak(
    int userID,
    NutrientType type,
    int amount,
  ) async {
    await transaction(() async {
      final streakID = await (into(streaks)).insert(StreaksCompanion.insert(unlockType: Value(UnlockType.badge)));

      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.nutrition,
          op: GoalOperator.logOnly,
          streakID: Value(streakID),
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

  Future<void> insertHydrationStreak(
    int userID,
    DateTime date,
    int amount,
    GoalOperator op,
  ) async {
    await transaction(() async {
      final streakID = await (into(streaks)).insert(StreaksCompanion.insert(unlockType: Value(UnlockType.badge)));

      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.hydration,
          thresholdValue: Value(amount.toDouble()),
          metricType: const Value('ml'),
          op: op,
          streakID: Value(streakID),
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

  Future<void> insertWeightGoal(
    int userID,
    double target,
    double start,
    GoalOperator op,
  ) async {
    await transaction(() async {
      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.nutrition,
          thresholdValue: Value(target.toDouble()),
          metricType: const Value('g'),
          op: op,
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

  Future<int> insertFastingGoal(
    int userID,
    double target,
    GoalOperator op,
    String targetMetric,
  ) async {
    int goalID = -1;
    await transaction(() async {
      goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.fasting,
          thresholdValue: Value(target.toDouble()),
          op: op,
        ),
      ));
      await into(fastingGoals).insert(
        FastingGoalsCompanion.insert(
          goalID: Value(goalID),
          targetHours: targetMetric == 'hours' ? Value(target) : Value(null),
          targetDays: targetMetric == 'days'
              ? Value(target.toInt())
              : Value(null),
          targetCalories: targetMetric == 'calories'
              ? Value(target.toInt())
              : Value(null),
        ),
      );
    });
    return goalID;
  }

  Future<void> makeFastingStreak(int goalID) async {
    final streakID = await (into(streaks)).insert(StreaksCompanion.insert(unlockType: Value(UnlockType.badge)));

    (update(goals)..where((g) => g.goalID.equals(goalID))).write(GoalsCompanion(streakID: Value(streakID)));
  }

  Future checkActiveStreak(GoalType type) {
    switch (type) {
      case GoalType.fasting:
        return checkActiveFastingStreak();
      case GoalType.weight:
        return checkActiveWeightStreak();
      case GoalType.hydration:
        return checkActiveHydrationStreak();
      case GoalType.nutrition:
        return checkActiveFoodStreak();
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
      daysProgress: streakRow.streakProgress,
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
      daysProgress: streakRow.streakProgress,
    );
  }

  Future<NutritionStreak?> checkActiveFoodStreak() async {
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
            .getSingleOrNull();

    if (streakRows == null) {
      return null;
    }

    final goalRow = streakRows.readTable(goals);
    final foodRow = streakRows.readTable(nutritionGoals);
    final streakRow = streakRows.readTable(streaks);

    return NutritionStreak(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      nType: foodRow.nutrientType,
      dailyNutritionTarget: foodRow.nutritionDailyTarget,
      streakID: streakRow.streakID,
      type: streakRow.unlockType ?? UnlockType.badge,
      start: streakRow.startDate,
      end: streakRow.endDate,
      daysProgress: streakRow.streakProgress,
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
      daysProgress: streakRow.streakProgress,
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
        daysProgress: streakRow.streakProgress,
      );
      nutritionStreaks.add(temp);
    }
    return nutritionStreaks;
  }

  Future findActiveGoal(GoalType type) {
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
    final goalRows =
        await (select(goals).join([
                innerJoin(
                  fastingGoals,
                  fastingGoals.goalID.equalsExp(goals.goalID),
                ),
              ])
              ..where(goals.type.equalsValue(GoalType.fasting))
              ..where(goals.isComplete.isValue(false))
              ..where(goals.streakID.isNull()))
            .getSingleOrNull();

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
    final goalRows =
        await (select(goals).join([
                innerJoin(
                  hydrationGoals,
                  hydrationGoals.goalID.equalsExp(goals.goalID),
                ),
              ])
              ..where(goals.type.equalsValue(GoalType.hydration))
              ..where(goals.isComplete.isValue(false))
              ..where(goals.streakID.isNull()))
            .getSingleOrNull();

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
      hdrAmount: hydrationRow.hdrAmount,
    );
  }

  Future<WeightGoalModel?> findActiveWeightGoal() async {
    final goalRows =
        await (select(goals).join([
                innerJoin(
                  weightGoals,
                  weightGoals.goalID.equalsExp(goals.goalID),
                ),
              ])
              ..where(goals.type.equalsValue(GoalType.weight))
              ..where(goals.isComplete.isValue(false))
              ..where(goals.streakID.isNull()))
            .getSingleOrNull();

    if (goalRows == null) {
      return null;
    }

    final goalRow = goalRows.readTable(goals);
    final weightRow = goalRows.readTable(weightGoals);

    return WeightGoalModel(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      targetWeight: weightRow.targetWeight,
      startWeight: weightRow.startWeight,
    );
  }

  Future<void> finishGoal(int goalID, {int streakID = -1}) async {
    (update(goals)..where((g) => g.goalID.equals(goalID))).write(
      GoalsCompanion(isComplete: Value(true)),
    );

    if (streakID > 0) {
      DateTime today = DateTime.now();
      (update(streaks)..where((s) => s.streakID.equals(streakID))).write(
        StreaksCompanion(endDate: Value(today)),
      );
    }
  }

  void deleteGoal(int goalID, GoalType type, {int streakID = -1}) {
    (delete(goals)..where((g) => g.goalID.equals(goalID))).go();

    switch (type) {
      case GoalType.fasting:
        (delete(fastingGoals)..where((g) => g.goalID.equals(goalID))).go();
      case GoalType.weight:
        (delete(weightGoals)..where((g) => g.goalID.equals(goalID))).go();
      case GoalType.hydration:
        (delete(hydrationGoals)..where((g) => g.goalID.equals(goalID))).go();
      case GoalType.nutrition:
        (delete(nutritionGoals)..where((g) => g.goalID.equals(goalID))).go();
    }

    if (streakID > 0) {
      (delete(streaks)..where((s) => s.streakID.equals(streakID))).go();
    }
  }

  void updateGoal(BasicGoal model) {
    (update(goals)..where((g) => g.goalID.equals(model.goalID))).write(
      GoalsCompanion(
        thresholdValue: Value(model.threshold),
        progressValue: Value(model.progress),
        op: Value(model.op),
      ),
    );
  }

  void updateStreak(BasicStreak model) {
    (update(goals)..where((g) => g.goalID.equals(model.goalID))).write(
      GoalsCompanion(
        thresholdValue: Value(model.threshold),
        progressValue: Value(model.progress),
        op: Value(model.op),
      ),
    );

    (update(streaks)..where((g) => g.streakID.equals(model.streakID))).write(
      StreaksCompanion(streakProgress: Value(model.daysProgress)),
    );
  }
}
