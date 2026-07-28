import 'package:testrun/database/tables/goal_tables.dart';

class StreakModel {
  final int goalID, streakID;
  final GoalType type;
  final double threshold, progress;
  final String op;
  final double? targetHours, targetWeight, startWeight;
  final int? targetDays, targetCalories, dailyNutritionTarget, hdrAmount;
  final NutrientType? nType;

  StreakModel.fasting(this.goalID, this.streakID, this.threshold, this.progress, this.op, this.targetHours, this.targetDays, this.targetCalories) : type = GoalType.fasting, startWeight = null, targetWeight = null, dailyNutritionTarget = null, hdrAmount = null, nType = null;

  StreakModel.weight(this.goalID, this.streakID, this.threshold, this.progress, this.op, this.targetWeight, this.startWeight) : type = GoalType.weight, targetDays = null, targetHours = null, targetCalories = null, dailyNutritionTarget = null, hdrAmount = null, nType = null;

  StreakModel.hydration(this.goalID, this.streakID, this.threshold, this.progress, this.op, this.hdrAmount) : type = GoalType.hydration, startWeight = null, targetWeight = null, dailyNutritionTarget = null, targetDays = null, targetHours = null, targetCalories = null, nType = null;

  StreakModel.nutrition(this.goalID, this.streakID, this.threshold, this.progress, this.op, this.nType, this.dailyNutritionTarget) : type = GoalType.nutrition, startWeight = null, targetWeight = null, targetDays = null, targetHours = null, targetCalories = null, hdrAmount = null;
}