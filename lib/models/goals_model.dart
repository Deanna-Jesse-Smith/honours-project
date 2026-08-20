import 'package:testrun/database/tables/goal_tables.dart';

sealed class BasicGoal {
   final int goalID;
   double threshold, progress;
   GoalOperator op;
   final MetricType metric;

  BasicGoal(this.goalID, this.threshold, this.progress, this.op, this.metric);

  BasicGoal.c({this.goalID = -1, this.threshold = 0, this.progress = 0, this.op = GoalOperator.greaterThan, this.metric = MetricType.hours});

  // double getPercent(num curState) {
  //   late double output;
  //   switch (op) {
  //     case GoalOperator.greaterThan:
  //        isComplete = curState > threshold;
  //     case GoalOperator.lesserThan:
  //       isComplete = curState < threshold;
  //     case GoalOperator.equalTo:
  //       isComplete = curState == threshold;
  //     case GoalOperator.greaterEqual:
  //       isComplete = curState >= threshold;
  //     case GoalOperator.lesserEqual:
  //       isComplete = curState <= threshold;
  //     case GoalOperator.logOnly:
  //       isComplete = true;
  //   }

  //   return output;
  // }
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

  int calculateProgress(double curState) {
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
    return daysProgress;
  }

  void increment() => daysProgress++;
}

class FastingGoalModel extends BasicGoal {
  FastingGoalModel(super.goalID, super.threshold, super.progress, super.op, super.metric);
}

class FastingStreak extends FastingGoalModel with BasicStreak {
  FastingStreak(super.goalID, super.threshold, super.progress, super.op, super.metric, {required int streakID, required UnlockType type, required DateTime start, required DateTime? end, required int daysProgress}) {
    setStreakData(streakID, type, start, end, daysProgress);
  }
}

class WeightGoalModel extends BasicGoal {
  final double startWeight;
  late bool isComplete;
  //? Isn't threshold the target weight here?
  WeightGoalModel(super.goalID, super.threshold, super.progress, super.op, super.metric, {required this.startWeight});

  bool calculateComplete(double curWeight) {
    switch (op) {
      case GoalOperator.greaterThan:
         isComplete = curWeight > threshold;
      case GoalOperator.lesserThan:
        isComplete = curWeight < threshold;
      case GoalOperator.equalTo:
        isComplete = curWeight == threshold;
      case GoalOperator.greaterEqual:
        

        isComplete = curWeight >= threshold;
      case GoalOperator.lesserEqual:
        isComplete = curWeight <= threshold;
      case GoalOperator.logOnly:
        isComplete = true;
    }
    progress = curWeight / threshold;
    return isComplete;
  }
}

class WeightStreak extends WeightGoalModel with BasicStreak {
  WeightStreak(super.goalID, super.threshold, super.progress, super.op, super.metric, {required super.startWeight, required int streakID, required UnlockType type, required DateTime start, required DateTime? end, required int daysProgress}) {
    setStreakData(streakID, type, start, end, daysProgress);
  }
}

class HydrationGoalModel extends BasicGoal {

  HydrationGoalModel(super.goalID, super.threshold, super.progress, super.op, super.metric);

    bool calculateComplete(double curWeight) {
      bool isComplete;
    switch (op) {
      case GoalOperator.greaterThan:
         isComplete = curWeight > threshold;
      case GoalOperator.lesserThan:
        isComplete = curWeight < threshold;
      case GoalOperator.equalTo:
        isComplete = curWeight == threshold;
      case GoalOperator.greaterEqual:
        isComplete = curWeight >= threshold;
      case GoalOperator.lesserEqual:
        isComplete = curWeight <= threshold;
      case GoalOperator.logOnly:
        isComplete = true;
    }
    progress = curWeight / threshold;
    return isComplete;
  }
}

class HydrationStreak extends HydrationGoalModel with BasicStreak {
  HydrationStreak(super.goalID, super.threshold, super.progress, super.op, super.metric, {required int streakID, required UnlockType type, required DateTime start, required DateTime? end, required int daysProgress}) {
    setStreakData(streakID, type, start, end, daysProgress);
  }
}

class NutritionGoalModel extends BasicGoal {
  // final int dailyNutritionTarget;
  // final NutrientType nType;

  NutritionGoalModel(super.goalID, super.threshold, super.progress, super.op, super.metric);
}

class NutritionStreak extends NutritionGoalModel with BasicStreak {
  NutritionStreak(super.goalID, super.threshold, super.progress, super.op, super.metric, {required int streakID, required UnlockType type, required DateTime start, required DateTime? end, required int daysProgress}) {
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

enum NutrientType { caloreis, fibre, fat, protein, carbs }

enum GoalType { fasting, weight, hydration, nutrition }

enum MetricType {
  meals52,
  hours,
  days,
  litres,
  kg,
  meals,
}

extension Display on GoalType {
  String get forDisplay => switch (this) {
    GoalType.fasting => 'Fasting Goals',
    GoalType.weight => 'Weight Goals',
    GoalType.hydration => 'Hydration Goals',
    GoalType.nutrition => 'Nutrition Goals',
  };

  String get goalText => switch (this) {
      GoalType.fasting => 'I will reach my fasting goal of:',
      GoalType.weight => 'I will weigh:',
      GoalType.hydration => 'I will drink:',
      GoalType.nutrition => 'I will reach my goal of logging:',
    };
}