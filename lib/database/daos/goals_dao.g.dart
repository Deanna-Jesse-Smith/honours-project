// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_dao.dart';

// ignore_for_file: type=lint
mixin _$GoalsDaoMixin on DatabaseAccessor<AppDatabase> {
  $StreaksTable get streaks => attachedDatabase.streaks;
  $GoalsTable get goals => attachedDatabase.goals;
  $FastingGoalsTable get fastingGoals => attachedDatabase.fastingGoals;
  $WeightGoalsTable get weightGoals => attachedDatabase.weightGoals;
  $HydrationGoalsTable get hydrationGoals => attachedDatabase.hydrationGoals;
  $NutritionGoalsTable get nutritionGoals => attachedDatabase.nutritionGoals;
  $UsersTable get users => attachedDatabase.users;
  $UserGoalProgressTable get userGoalProgress =>
      attachedDatabase.userGoalProgress;
  GoalsDaoManager get managers => GoalsDaoManager(this);
}

class GoalsDaoManager {
  final _$GoalsDaoMixin _db;
  GoalsDaoManager(this._db);
  $$StreaksTableTableManager get streaks =>
      $$StreaksTableTableManager(_db.attachedDatabase, _db.streaks);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db.attachedDatabase, _db.goals);
  $$FastingGoalsTableTableManager get fastingGoals =>
      $$FastingGoalsTableTableManager(_db.attachedDatabase, _db.fastingGoals);
  $$WeightGoalsTableTableManager get weightGoals =>
      $$WeightGoalsTableTableManager(_db.attachedDatabase, _db.weightGoals);
  $$HydrationGoalsTableTableManager get hydrationGoals =>
      $$HydrationGoalsTableTableManager(
        _db.attachedDatabase,
        _db.hydrationGoals,
      );
  $$NutritionGoalsTableTableManager get nutritionGoals =>
      $$NutritionGoalsTableTableManager(
        _db.attachedDatabase,
        _db.nutritionGoals,
      );
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$UserGoalProgressTableTableManager get userGoalProgress =>
      $$UserGoalProgressTableTableManager(
        _db.attachedDatabase,
        _db.userGoalProgress,
      );
}
