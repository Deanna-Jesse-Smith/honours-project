import 'package:testrun/database/tables/goal_tables.dart';

sealed class BasicGoal {
   final int goalID;
   double threshold, progress;
   final GoalOperator op;

  BasicGoal(this.goalID, this.threshold, this.progress, this.op);
}

mixin BasicStreak on BasicGoal {
  late final int streakID, daysProgress;
  late final DateTime start;
  late final DateTime? end;
  late final UnlockType unlockType;
  late bool isComplete;

  void setStreakData(int streakID, UnlockType type, DateTime start, DateTime? end, int daysProgress) {
    this.streakID = streakID;
    unlockType = type;
    this.start = start;
    this.end = end;
    this.daysProgress = daysProgress;
  }

  void calculateProgress(double curState) {
    switch (op) {
      case GoalOperator.greaterThan:
         isComplete = curState > threshold;
      case GoalOperator.lesserThan:
        isComplete = curState < threshold;
      case GoalOperator.equalTo:
        isComplete = curState == threshold;
      case GoalOperator.greaterEqual:
        isComplete = curState >= threshold;
      case GoalOperator.lesserEqual:
        isComplete = curState <= threshold;
      case GoalOperator.logOnly:
        isComplete = true;
    }

    if (isComplete) {
      daysProgress++;
    }
  }
}

class FastingGoalModel extends BasicGoal {
  final double? targetHours;
  final int? targetDays, targetCalories;

  FastingGoalModel(super.goalID, super.threshold, super.progress, super.op, {required this.targetHours, required this.targetDays, required this.targetCalories});
}

class FastingStreak extends FastingGoalModel with BasicStreak {
  FastingStreak(super.goalID, super.threshold, super.progress, super.op, {required super.targetHours, required super.targetDays, required super.targetCalories, required int streakID, required UnlockType type, required DateTime start, required DateTime? end, required int daysProgress}) {
    setStreakData(streakID, type, start, end, daysProgress);
  }
}

class WeightGoalModel extends BasicGoal {
  final double targetWeight, startWeight;
  late bool isComplete;
  //? Isn't threshold the target weight here?
  WeightGoalModel(super.goalID, super.threshold, super.progress, super.op, {required this.targetWeight, required this.startWeight});

  bool calculateComplete(double curWeight) {
    switch (op) {
      case GoalOperator.greaterThan:
         isComplete = curWeight > targetWeight;
      case GoalOperator.lesserThan:
        isComplete = curWeight < targetWeight;
      case GoalOperator.equalTo:
        isComplete = curWeight == targetWeight;
      case GoalOperator.greaterEqual:
        isComplete = curWeight >= targetWeight;
      case GoalOperator.lesserEqual:
        isComplete = curWeight <= targetWeight;
      case GoalOperator.logOnly:
        isComplete = true;
    }
    progress = curWeight / targetWeight;
    return isComplete;
  }
}

class WeightStreak extends WeightGoalModel with BasicStreak {
  WeightStreak(super.goalID, super.threshold, super.progress, super.op, {required super.targetWeight, required super.startWeight, required int streakID, required UnlockType type, required DateTime start, required DateTime? end, required int daysProgress}) {
    setStreakData(streakID, type, start, end, daysProgress);
  }
}

class HydrationGoalModel extends BasicGoal {
  final int hdrAmount;

  HydrationGoalModel(super.goalID, super.threshold, super.progress, super.op, {required this.hdrAmount});
}

class HydrationStreak extends HydrationGoalModel with BasicStreak {
  HydrationStreak(super.goalID, super.threshold, super.progress, super.op, {required super.hdrAmount, required int streakID, required UnlockType type, required DateTime start, required DateTime? end, required int daysProgress}) {
    setStreakData(streakID, type, start, end, daysProgress);
  }
}

class NutritionGoalModel extends BasicGoal {
  final int dailyNutritionTarget;
  final NutrientType nType;

  NutritionGoalModel(super.goalID, super.threshold, super.progress, super.op, {required this.nType, required this.dailyNutritionTarget});
}

class NutritionStreak extends NutritionGoalModel with BasicStreak {
  List<NutritionStreak> streaks = [];
  NutritionStreak(super.goalID, super.threshold, super.progress, super.op, {required super.nType, required super.dailyNutritionTarget, required int streakID, required UnlockType type, required DateTime start, required DateTime? end, required int daysProgress}) {
    setStreakData(streakID, type, start, end, daysProgress);
  }
}

enum GoalOperator {greaterThan, lesserThan, equalTo, greaterEqual, lesserEqual, logOnly }

extension GoalOperatorHelper on GoalOperator {
  String get symbol => switch (this) {
    GoalOperator.greaterThan => '>',
    GoalOperator.lesserThan => '<',
    GoalOperator.equalTo => '=',
    GoalOperator.greaterEqual => '>=',
    GoalOperator.lesserEqual => '<=',
    GoalOperator.logOnly => 'log',
  };
}