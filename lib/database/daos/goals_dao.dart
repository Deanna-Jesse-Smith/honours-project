import 'package:drift/drift.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import '../database.dart';

part 'goals_dao.g.dart';

@DriftAccessor(tables: [Goals, FastingGoals, WeightGoals, HydrationGoals, NutritionGoals, Streaks, UserGoalProgress])
class GoalsDao extends DatabaseAccessor<AppDatabase> with _$GoalsDaoMixin {
  GoalsDao(super.db);

  
}