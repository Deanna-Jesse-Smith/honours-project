import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    double amount,
  ) async {
    await transaction(() async {
      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.nutrition,
          op: GoalOperator.logOnly,
          metricType: MetricType.meals,
          thresholdValue: Value(amount),
        ),
      ));
      //? Put something here in case they should be below a threshold? Use the operator field?
      await into(nutritionGoals).insert(
        NutritionGoalsCompanion.insert(
          goalID: Value(goalID),
          nutrientType: type,
          nutritionDailyTarget: amount.toInt(),
        ),
      );
    });
  }

  Future<void> insertHydrationGoal(
    int userID,
    DateTime date,
    int amount,
    GoalOperator op,
  ) async {
    await transaction(() async {
      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.hydration,
          thresholdValue: Value(amount.toDouble()),
          metricType: MetricType.litres,
          op: op,
          lastEvaluated: Value(date.subtract(const Duration(days: 1))),
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
          type: GoalType.weight,
          thresholdValue: Value(target.toDouble()),
          metricType: MetricType.kg,
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

  Future<void> insertFastingGoal(
    int userID,
    double target,
    GoalOperator op,
    MetricType targetMetric,
  ) async {
    int goalID = -1;
    await transaction(() async {
      goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.fasting,
          thresholdValue: Value(target.toDouble()),
          op: op,
          metricType: targetMetric,
        ),
      ));
      await into(fastingGoals).insert(
        FastingGoalsCompanion.insert(
          goalID: Value(goalID),
          targetHours: targetMetric == MetricType.hours
              ? Value(target)
              : Value(null),
          targetDays: targetMetric == MetricType.days
              ? Value(target.toInt())
              : Value(null),
          targetCalories: targetMetric == MetricType.meals52
              ? Value(target.toInt())
              : Value(null),
        ),
      );
    });
  }

  // Future<void> makeFastingStreak(int goalID) async {
  //   final streakID = await (into(streaks)).insert(StreaksCompanion.insert(unlockType: Value(UnlockType.badge)));

  //   (update(goals)..where((g) => g.goalID.equals(goalID))).write(GoalsCompanion(streakID: Value(streakID)));
  // }

  Future<BasicStreak?> checkActiveStreak(GoalType type) {
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
                innerJoin(streaks, streaks.goalID.equalsExp(goals.goalID)),
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
      goalRow.metricType,
      goalRow.lastEvaluated,
      goalRow.isComplete,
      streakID: streakRow.streakID,
      type: streakRow.unlockType ?? UnlockType.badge,
      start: streakRow.startDate,
      end: streakRow.endDate,
      daysProgress: streakRow.streakProgress,
      curPeriod: streakRow.curEvalPeriod,
      lastPeriod: streakRow.lastEvalEnd,
    );
  }

  Stream<int?> getActiveFastingStreak() {
    final streakRows =
        (selectOnly(goals).join([
            innerJoin(
              fastingGoals,
              fastingGoals.goalID.equalsExp(goals.goalID),
            ),
            innerJoin(streaks, streaks.goalID.equalsExp(goals.goalID)),
          ])
          ..addColumns([streaks.streakProgress])
          ..where(streaks.endDate.isNull())
          ..where(goals.type.equalsValue(GoalType.fasting)));

    return streakRows.watchSingleOrNull().map(
      (row) => row?.read(streaks.streakProgress),
    );
  }

  Stream<int?> getActiveHydrationStreak() {
    final streakRows =
        (selectOnly(goals).join([
            innerJoin(
              hydrationGoals,
              hydrationGoals.goalID.equalsExp(goals.goalID),
            ),
            innerJoin(streaks, streaks.goalID.equalsExp(goals.goalID)),
          ])
          ..addColumns([streaks.streakProgress])
          ..where(streaks.endDate.isNull())
          ..where(goals.type.equalsValue(GoalType.hydration)));

    return streakRows.watchSingleOrNull().map((row) {
      debugPrint("Streak Watching: ${row?.read(streaks.streakProgress)}");
      return row?.read(streaks.streakProgress);
    });
  }

  Stream<int?> getActiveFoodStreak() {
    final streakRows =
        (selectOnly(goals).join([
            innerJoin(
              nutritionGoals,
              nutritionGoals.goalID.equalsExp(goals.goalID),
            ),
            innerJoin(streaks, streaks.goalID.equalsExp(goals.goalID)),
          ])
          ..addColumns([streaks.streakProgress])
          ..where(streaks.endDate.isNull())
          ..where(goals.type.equalsValue(GoalType.fasting)));

    return streakRows.watchSingleOrNull().map(
      (row) => row?.read(streaks.streakProgress),
    );
  }

  Future<HydrationStreak?> checkActiveHydrationStreak() async {
    final streakRows =
        await (select(goals).join([
                innerJoin(streaks, streaks.goalID.equalsExp(goals.goalID)),
              ])
              ..where(streaks.endDate.isNull())
              ..where(goals.type.equalsValue(GoalType.hydration)))
            .getSingleOrNull();

    if (streakRows == null) {
      return null;
    }

    final goalRow = streakRows.readTable(goals);
    // final hydrationRow = streakRows.readTable(hydrationGoals);
    final streakRow = streakRows.readTable(streaks);

    return HydrationStreak(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      goalRow.metricType,
      goalRow.lastEvaluated,
      goalRow.isComplete,
      // hdrAmount: hydrationRow.hdrAmount,
      streakID: streakRow.streakID,
      type: streakRow.unlockType ?? UnlockType.badge,
      start: streakRow.startDate,
      end: streakRow.endDate,
      daysProgress: streakRow.streakProgress,
      curPeriod: streakRow.curEvalPeriod,
      lastPeriod: streakRow.lastEvalEnd,
    );
  }

  Future<NutritionStreak?> checkActiveFoodStreak() async {
    final streakRows =
        await (select(goals).join([
                innerJoin(
                  nutritionGoals,
                  nutritionGoals.goalID.equalsExp(goals.goalID),
                ),
                innerJoin(streaks, streaks.goalID.equalsExp(goals.goalID)),
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
      goalRow.metricType,
      goalRow.lastEvaluated,
      goalRow.isComplete,
      // nType: foodRow.nutrientType,
      // dailyNutritionTarget: foodRow.nutritionDailyTarget,
      streakID: streakRow.streakID,
      type: streakRow.unlockType ?? UnlockType.badge,
      start: streakRow.startDate,
      end: streakRow.endDate,
      daysProgress: streakRow.streakProgress,
      curPeriod: streakRow.curEvalPeriod,
      lastPeriod: streakRow.lastEvalEnd,
    );
  }

  Future<WeightStreak?> checkActiveWeightStreak() async {
    final streakRows =
        await (select(goals).join([
                innerJoin(
                  weightGoals,
                  weightGoals.goalID.equalsExp(goals.goalID),
                ),
                innerJoin(streaks, streaks.goalID.equalsExp(goals.goalID)),
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
      goalRow.metricType,
      goalRow.lastEvaluated,
      goalRow.isComplete,
      startWeight: weightRow.startWeight,
      // targetWeight: weightRow.targetWeight,
      streakID: streakRow.streakID,
      type: streakRow.unlockType ?? UnlockType.badge,
      start: streakRow.startDate,
      end: streakRow.endDate,
      daysProgress: streakRow.streakProgress,
      curPeriod: streakRow.curEvalPeriod,
      lastPeriod: streakRow.lastEvalEnd,
    );
  }

  Future<NutritionGoalModel?> findActiveNutritionGoal() async {
    final goalRows =
        await (select(goals).join([
                innerJoin(
                  nutritionGoals,
                  nutritionGoals.goalID.equalsExp(goals.goalID),
                ),
              ])
              ..where(goals.type.equalsValue(GoalType.nutrition))
              ..orderBy([OrderingTerm.desc(goals.goalID)])
              ..limit(1))
            .getSingleOrNull();

    if (goalRows == null) {
      return null;
    }

    final goalRow = goalRows.readTable(goals);
    final nutritionRow = goalRows.readTable(nutritionGoals);

    return NutritionGoalModel(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      goalRow.metricType,
      goalRow.lastEvaluated,
      goalRow.isComplete,
      // hdrAmount: hydrationRow.hdrAmount,
    );
  }

  Future<List<NutritionStreak?>> checkActiveNutrientStreaks() async {
    final streakRows =
        await (select(goals).join([
                innerJoin(
                  nutritionGoals,
                  nutritionGoals.goalID.equalsExp(goals.goalID),
                ),
                innerJoin(streaks, streaks.goalID.equalsExp(goals.goalID)),
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
        goalRow.metricType,
        goalRow.lastEvaluated,
        goalRow.isComplete,
        // nType: nutritionRow.nutrientType,
        // dailyNutritionTarget: nutritionRow.nutritionDailyTarget,
        streakID: streakRow.streakID,
        type: streakRow.unlockType ?? UnlockType.badge,
        start: streakRow.startDate,
        end: streakRow.endDate,
        daysProgress: streakRow.streakProgress,
        curPeriod: streakRow.curEvalPeriod,
        lastPeriod: streakRow.lastEvalEnd,
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
        return findActiveWeightGoal();
      case GoalType.hydration:
        return findActiveHydrationGoal();
      case GoalType.nutrition:
        return findActiveFoodGoal();
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
              ..limit(1)
            // ..where(goals.streakID.isNull()))
            )
            .getSingleOrNull();
            debugPrint('Fasting goal: ${goalRows == null}');
    if (goalRows == null) {
      return null;
    }

    final goalRow = goalRows.readTable(goals);
    final fastingRow = goalRows.readTable(fastingGoals);

    debugPrint('Fasting goal: $goalRow');

    return FastingGoalModel(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      goalRow.metricType,
      goalRow.lastEvaluated,
      goalRow.isComplete,
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
              ..orderBy([OrderingTerm.desc(goals.goalID)])
              ..limit(1))
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
      goalRow.metricType,
      goalRow.lastEvaluated,
      goalRow.isComplete,
      // hdrAmount: hydrationRow.hdrAmount,
    );
  }

  Future<NutritionGoalModel?> findActiveFoodGoal() async {
    final goalRows =
        await (select(goals).join([
                innerJoin(
                  nutritionGoals,
                  nutritionGoals.goalID.equalsExp(goals.goalID),
                ),
              ])
              ..where(goals.type.equalsValue(GoalType.nutrition))
              ..where(goals.isComplete.isValue(false))
            // ..where(goals.streakID.isNull()))
            )
            .getSingleOrNull();

    if (goalRows == null) {
      return null;
    }

    final goalRow = goalRows.readTable(goals);
    final nutritionRow = goalRows.readTable(nutritionGoals);

    return NutritionGoalModel(
      goalRow.goalID,
      goalRow.thresholdValue ?? 0,
      goalRow.progressValue,
      goalRow.op,
      goalRow.metricType,
      goalRow.lastEvaluated,
      goalRow.isComplete,
      // hdrAmount: hydrationRow.hdrAmount,
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
              ..orderBy([OrderingTerm.desc(goals.goalID)])
              ..limit(1)
            // ..where(goals.streakID.isNull()))
            )
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
      goalRow.metricType,
      goalRow.lastEvaluated,
      goalRow.isComplete,
      // targetWeight: weightRow.targetWeight,
      startWeight: weightRow.startWeight,
    );
  }

  Future<void> finishGoal(int goalID) async {
    (update(goals)..where((g) => g.goalID.equals(goalID))).write(
      GoalsCompanion(isComplete: Value(true)),
    );

    await (update(streaks)
          ..where((s) => s.goalID.equals(goalID) & s.endDate.isNull()))
        .write(StreaksCompanion(endDate: Value(DateTime.now())));
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

  Future<void> updateGoal(BasicGoal model, int id) async {
    await (update(goals)..where((g) => g.goalID.equals(model.goalID))).write(
      GoalsCompanion(isComplete: Value(true)),
    );

    switch (model) {
      case FastingGoalModel():
        await insertFastingGoal(id, model.threshold, model.op, model.metric);
      case WeightGoalModel():
        await insertWeightGoal(
          id,
          model.threshold,
          model.startWeight,
          model.op,
        );
      case HydrationGoalModel():
        await insertHydrationGoal(
          id,
          DateTime.now(),
          model.threshold.toInt(),
          model.op,
          // lastEvaluated:
        );
      case NutritionGoalModel():
        await insertNutritionGoal(id, NutrientType.caloreis, model.threshold);
      case BasicStreak():
        throw UnimplementedError();
    }

    final streak = await (select(
      streaks,
    )..where((s) => s.goalID.isValue(model.goalID))).getSingleOrNull();
    if (streak != null) {
      (update(streaks)..where((g) => g.goalID.equals(streak.streakID))).write(
        StreaksCompanion(endDate: Value(DateTime.now())),
      );
    }
  }

  Future<void> updateStreak(BasicStreak model) async {
    await (update(goals)..where((g) => g.goalID.equals(model.goalID))).write(
      GoalsCompanion(
        lastEvaluated: Value(model.lastEval),
        // isComplete: Value(true),
      ),
    );
    await (update(
      streaks,
    )..where((g) => g.streakID.equals(model.streakID))).write(
      StreaksCompanion(
        streakProgress: Value(model.daysProgress + 1),
        curEvalPeriod: Value(model.curPeriod),
        lastEvalEnd: Value(model.lastPeriod),
      ),
    );
  }

  Future<void> updateEvaluation(int id, DateTime updated) {
    return (update(goals)..where((g) => g.goalID.equals(id))).write(
      GoalsCompanion(lastEvaluated: Value(updated)),
    );
  }

  Future<void> insertStreak(
    int goalID,
    DateTime today,
    DateTime curPeriod,
    DateTime lastPeriod,
  ) async {
    await (update(goals)..where((g) => g.goalID.equals(goalID))).write(
      // GoalsCompanion(lastEvaluated: Value(today), isComplete: Value(true)),
      GoalsCompanion(lastEvaluated: Value(today),),
    );

    await into(streaks).insert(
      StreaksCompanion.insert(
        goalID: goalID,
        startDate: Value(today),
        unlockType: Value(UnlockType.badge),
        streakProgress: Value(1),
        curEvalPeriod: Value(curPeriod),
        lastEvalEnd: Value(lastPeriod),
      ),
    );
  }

  Future<void> breakStreak(BasicStreak streak) async {
    await (update(goals)..where((g) => g.goalID.equals(streak.goalID))).write(
      GoalsCompanion(
        lastEvaluated: Value(streak.lastEval),
        isComplete: Value(false),
      ),
    );

    await (update(streaks)..where((s) => s.streakID.equals(streak.streakID)))
        .write(StreaksCompanion(endDate: Value(streak.lastEval)));
  }

  Future<void> breakStreakTEMP(BasicStreak streak, DateTime breakDate) async {
    await (update(goals)..where((g) => g.goalID.equals(streak.goalID))).write(
      GoalsCompanion(
        lastEvaluated: Value(streak.lastEval),
        isComplete: Value(false),
      ),
    );

    await (update(streaks)..where((s) => s.streakID.equals(streak.streakID)))
        .write(StreaksCompanion(endDate: Value(breakDate)));
  }

  void createDummyGoals() {
    insertFastingGoal(0, 8, GoalOperator.greaterThan, MetricType.hours);
    insertHydrationGoal(0, DateTime(2026, 8, 10), 1, GoalOperator.greaterEqual);
    insertWeightGoal(0, 58, 60, GoalOperator.lesserEqual);
  }

  Future<int?> findBestStreak(GoalType type) async {
    final countProgress = streaks.streakProgress.max();
    final records =
        await (selectOnly(streaks)
              ..join([innerJoin(goals, goals.goalID.equalsExp(streaks.goalID))])
              ..addColumns([countProgress])
              ..where(goals.type.equalsValue(type)))
            .getSingle();

    return records.read(countProgress);
  }

  Future<void> checkGoals() async {
    // createDummyGoals();
    debugPrint("Checking goals");
    final goalss = await (select(goals)).get();

    for (final goala in goalss) {
      debugPrint(goala.toString());
    }
  }

  Future<int> evaluateConcerns(GoalType type, DateTime windowStart) async {
    final data =
        (select(
            streaks,
          ).join([innerJoin(goals, goals.goalID.equalsExp(streaks.goalID))]))
          ..where(goals.type.equalsValue(type))
          ..where(streaks.startDate.isSmallerOrEqualValue(windowStart))
          ..where(streaks.endDate.isBiggerOrEqualValue(windowStart));
    final huh = await data.get();
    return huh.length;
  }

  Future<int> evaluatePR(GoalType type, DateTime windowStart) async {
    final days = CustomExpression<int>('''
  CAST(
    julianday(date(COALESCE(end_date, 'now')))
    - julianday(date(start_date))
    AS INTEGER
  )
  ''', precedence: Precedence.primary);
    final data =
        (select(
            streaks,
          ).join([innerJoin(goals, goals.goalID.equalsExp(streaks.goalID))]))
          ..addColumns([days])
          ..where(goals.type.equalsValue(type))
          ..where(streaks.startDate.isSmallerOrEqualValue(windowStart))
          ..where(
            // streaks.endDate.isBiggerOrEqualValue(windowStart) |
                streaks.endDate.isNull(),
          );

    final dataOutput = await data.getSingleOrNull();

    if (dataOutput != null) return dataOutput.read(days) ?? 0;
    return 0;

    // int numValid = 0;

    // for (final row in dataOutput) {
    //   int len = row.read(days) ?? 0;
    //   if (len > 3) numValid++;
    // }
    // return numValid;
  }

  void setComplete(bool isComplete, int goalID) {
    (update(goals)..where((g) => g.goalID.equals(goalID))).write(
      GoalsCompanion(isComplete: Value(isComplete)),
    );
  }
}
