import 'package:testrun/database/tables/goal_tables.dart';

sealed class BasicGoal {
   final int goalID;
   final double threshold, progress;
   final String op;

  BasicGoal(this.goalID, this.threshold, this.progress, this.op);
}

mixin BasicStreak on BasicGoal {
  late final int bestStreak, streakID;
  late final DateTime? start;
  late final DateTime? end;
  late final UnlockType unlockType;

  void setStreakData(int streakID, int bestStreak, UnlockType type, DateTime start, DateTime? end) {
    this.streakID = streakID;
    this.bestStreak = bestStreak;
    unlockType = type;
    this.start = start;
    this.end = end;
  }
}

class FastingGoal extends BasicGoal {
  final double? targetHours;
  final int? targetDays, targetCalories;

  FastingGoal(super.goalID, super.threshold, super.progress, super.op, {required this.targetHours, required this.targetDays, required this.targetCalories});
}

class FastingStreak extends FastingGoal with BasicStreak {
  FastingStreak(super.goalID, super.threshold, super.progress, super.op, {required super.targetHours, required super.targetDays, required super.targetCalories, required int streakID, required int bestStreak, required UnlockType type, required DateTime start, required DateTime end}) {
    setStreakData(streakID, bestStreak, type, start, end);
  }
}

class WeightGoal extends BasicGoal {
  final double? targetWeight, startWeight;

  WeightGoal(super.goalID, super.threshold, super.progress, super.op, {required this.targetWeight, required this.startWeight});
}

class WeightStreak extends WeightGoal with BasicStreak {
  WeightStreak(super.goalID, super.threshold, super.progress, super.op, {required super.targetWeight, required super.startWeight, required int streakID, required int bestStreak, required UnlockType type, required DateTime start, required DateTime end}) {
    setStreakData(streakID, bestStreak, type, start, end);
  }
}

class HydrationGoal extends BasicGoal {
  final int? hdrAmount;

  HydrationGoal(super.goalID, super.threshold, super.progress, super.op, {required this.hdrAmount});
}

class HydrationStreak extends HydrationGoal with BasicStreak {
  HydrationStreak(super.goalID, super.threshold, super.progress, super.op, {required super.hdrAmount, required int streakID, required int bestStreak, required UnlockType type, required DateTime start, required DateTime end}) {
    setStreakData(streakID, bestStreak, type, start, end);
  }
}

class NutritionGoal extends BasicGoal {
  final int? dailyNutritionTarget;
  final NutrientType? nType;

  NutritionGoal(super.goalID, super.threshold, super.progress, super.op, {required this.nType, required this.dailyNutritionTarget});
}

class NutritionStreak extends NutritionGoal with BasicStreak {
  NutritionStreak(super.goalID, super.threshold, super.progress, super.op, {required super.nType, required super.dailyNutritionTarget, required int streakID, required int bestStreak, required UnlockType type, required DateTime? start, required DateTime? end}) {
    setStreakData(streakID, bestStreak, type, start, end);
  }
}