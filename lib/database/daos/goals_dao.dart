import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
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
          op: GoalOperator.logOnly,
          metricType: MetricType.meals,
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
    GoalOperator op,
  ) async {
    await transaction(() async {
      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.hydration,
          thresholdValue: Value(amount.toDouble()),
          metricType: MetricType.litres,
          op: op,
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

  Future<int> insertFastingGoal(
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
    return goalID;
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
      streakID: streakRow.streakID,
      type: streakRow.unlockType ?? UnlockType.badge,
      start: streakRow.startDate,
      end: streakRow.endDate,
      daysProgress: streakRow.streakProgress,
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

    return streakRows.watchSingleOrNull().map(
      (row) => row?.read(streaks.streakProgress),
    );
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
                innerJoin(
                  hydrationGoals,
                  hydrationGoals.goalID.equalsExp(goals.goalID),
                ),
                innerJoin(streaks, streaks.goalID.equalsExp(goals.goalID)),
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
      goalRow.metricType,
      // hdrAmount: hydrationRow.hdrAmount,
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
      // nType: foodRow.nutrientType,
      // dailyNutritionTarget: foodRow.nutritionDailyTarget,
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
      startWeight: weightRow.startWeight,
      // targetWeight: weightRow.targetWeight,
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
        // nType: nutritionRow.nutrientType,
        // dailyNutritionTarget: nutritionRow.nutritionDailyTarget,
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
      goalRow.metricType,
      // targetHours: fastingRow.targetHours,
      // targetDays: fastingRow.targetDays,
      // targetCalories: fastingRow.targetCalories,
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
      // targetWeight: weightRow.targetWeight,
      startWeight: weightRow.startWeight,
    );
  }

  Future<void> finishGoal(int goalID) async {
    (update(goals)..where((g) => g.goalID.equals(goalID))).write(
      GoalsCompanion(isComplete: Value(true)),
    );

    await (update(streaks)
      ..where((s) =>
          s.goalID.equals(goalID) &
          s.endDate.isNull()))
    .write(
      StreaksCompanion(
        endDate: Value(DateTime.now()),
      ),
    );
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

  Future<void> updateGoal(BasicGoal model) async {
    (update(goals)..where((g) => g.goalID.equals(model.goalID))).write(
      GoalsCompanion(isComplete: Value(true)),
    );

    //! Create the copy stuff later

    final streak = await (select(
      streaks,
    )..where((s) => s.goalID.isValue(model.goalID))).getSingleOrNull();
    if (streak != null) {
      (update(streaks)..where((g) => g.goalID.equals(streak.streakID))).write(
        StreaksCompanion(endDate: Value(DateTime.now())),
      );
    }
  }

  void updateStreak(BasicStreak model) {
    // (update(goals)..where((g) => g.goalID.equals(model.goalID))).write(
    //   GoalsCompanion(
    //     thresholdValue: Value(model.threshold),
    //     progressValue: Value(model.progress),
    //     op: Value(model.op),
    //   ),
    // );

    DateTime temp = model.start.add(Duration(days: model.daysProgress));
    Duration diffProgress = temp.difference(model.start);
    Duration diffToday = DateTime.now().difference(model.start);

    if (diffToday.inDays == diffProgress.inDays) {
    } else if (diffToday.inDays > diffProgress.inDays - 2) {
      (update(streaks)..where((g) => g.streakID.equals(model.streakID))).write(
        StreaksCompanion(streakProgress: Value(model.daysProgress + 1)),
      );
    } else {
      temp.add(Duration(days: 1));
      (update(streaks)..where((s) => s.streakID.equals(model.streakID))).write(
        StreaksCompanion(endDate: Value(temp)),
      );
    }
  }

  void breakStreak(BasicStreak curStreak) {
    (update(streaks)..where((s) => s.streakID.equals(curStreak.streakID)))
        .write(StreaksCompanion(endDate: Value(DateTime.now())));
  }

  void insertStreak(int goalID) {
    into(streaks).insert(
      StreaksCompanion.insert(
        goalID: goalID,
        startDate: Value(DateTime.now()),
        unlockType: Value(UnlockType.badge),
      ),
    );
  }

  void createDummyGoals() {
    insertFastingGoal(0, 8, GoalOperator.greaterThan, MetricType.hours);
    insertHydrationGoal(0, DateTime(2026, 8, 10), 1, GoalOperator.greaterEqual);
    insertWeightGoal(0, 58, 60, GoalOperator.lesserEqual);
  }

  Future<void> checkGoals() async {
    // createDummyGoals();
    debugPrint("Checking goals");
    final goalss = await (select(goals)).get();

    for (final goala in goalss) {
      debugPrint(goala.toString());
    }
  }
}
