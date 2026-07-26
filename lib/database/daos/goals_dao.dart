import 'package:drift/drift.dart';
import 'package:testrun/database/tables/goal_tables.dart';
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

  Future<void> insertNutritionGoal(int userID, String type, int amount) async {
    await transaction(() async {
      final goalID = await (into(goals).insert(
        GoalsCompanion.insert(
          type: GoalType.nutrition,
          thresholdValue: Value(amount.toDouble()),
          metricType: const Value('g'),
          op: const Value('>='),
        ),
      ));
      //? Put something here in case they should be below a threshold?
      await into(nutritionGoals).insert(
        NutritionGoalsCompanion.insert(
          goalID: Value(goalID),
          nutrientType: Value(type),
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

  Future<List<Streak>> checkStreak(int streakID, StreakType type, {String nutrientType = ''}) {
    //! Put the streak type comparison in here
    final streakss = (select(streaks)..where((s) => s.streakID.equals(streakID) & s.streakProgress.isSmallerThanValue(1) & s.endDate.isSmallerThanValue(DateTime.now()))).get();
    return streakss;
  }
  
}
