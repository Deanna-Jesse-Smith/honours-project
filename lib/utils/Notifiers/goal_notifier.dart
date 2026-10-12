import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/utils/user_state.dart';

@riverpod
class AsyncGoals extends AsyncNotifier<BasicGoal?> {
  late UserSessionData? session;
  @override
  FastingGoalModel build() {
    session = ref.watch(userSessionProvider).value;
    return FastingGoalModel(
      0,
      0,
      0,
      GoalOperator.logOnly,
      MetricType.hours,
      DateTime.now(),
      false,
    );
  }

  Future<BasicGoal?> findGoal(GoalType type) {
    return ref.read(gDaoProvider).findActiveGoal(type);
  }

  /// Returns the start and end dates of the current week, with the start date being Monday and the end date being Sunday.
  (DateTime, DateTime) bookendWeek() {
    DateTime today = DateUtils.dateOnly(DateTime.now());

    DateTime start = today.subtract(
      Duration(days: findMonday(today.weekday, 0)),
    );
    DateTime end = start.add(const Duration(days: 7));

    return (start, end);
  }

  int findMonday(int day, int count) {
    if (day == 1) {
      return count;
    } else {
      return findMonday(day - 1, count + 1);
    }
  }

  /// Returns the date of the next occurrence of the specified day of the week, or null if that day has already passed in the current week.
  DateTime? getFullDay(int dayOfWeek) {
    dayOfWeek++;
    DateTime now = DateTime.now();
    if (now.weekday > dayOfWeek) return null;

    int findDay(int day, int count) {
      if (day == dayOfWeek) {
        return count;
      } else {
        return findDay(day - 1, count + 1);
      }
    }

    DateTime start = now.subtract(Duration(days: findDay(now.weekday, 0)));
    return DateUtils.dateOnly(start);
  }

  /// Checks the progress of the nutrition goal and returns a tuple containing the percentage and threshold.
  Future<(double, double)> checkNutritionGoalPercent() async {
    final goal = await ref.read(gDaoProvider).findActiveFoodGoal();

    if (goal == null) {
      return (-1.0, 0.0);
    }

    final curCalories = await ref
        .read(nDaoProvider)
        .getDaysCalories(DateUtils.dateOnly(DateTime.now()));

    if (curCalories == 0) {
      return (0.05, goal.threshold);
    } else {
      return ((curCalories / goal.threshold).clamp(0.05, 1.0), goal.threshold);
    }
  }

  /// Checks if the nutrition goal has been met and returns a boolean indicating the result.
  Future<bool> checkNutritionGoal() async {
    final goal = await ref.read(gDaoProvider).findActiveFoodGoal();

    if (goal == null) {
      return false;
    }
    int goalID = goal.goalID;
    DateTime today = DateUtils.dateOnly(DateTime.now());
    late double percent;

    final curCalories = await ref
        .read(nDaoProvider)
        .getDaysCalories(today);

    if (curCalories == 0) {
      return false;
    } else {
      percent = (curCalories / goal.threshold).clamp(0.05, 1.0);

      BasicStreak? curStreak = await ref
          .read(gDaoProvider)
          .checkActiveStreak(GoalType.nutrition);
      bool doCelebrate = false;

      if (curStreak != null) {
        if (DateUtils.isSameDay(today, curStreak.curPeriod)) {
          if (
            today
          .isAfter(DateUtils.dateOnly(curStreak.lastPeriod))) {
            if (percent == 1) {
              curStreak.curPeriod =
                today.add(const Duration(days: 1));
              curStreak.lastPeriod = today;
              await ref.read(gDaoProvider).updateStreak(curStreak);
              doCelebrate = true;
            }
          }
        } else if (DateUtils.dateOnly(curStreak.curPeriod).isBefore(today)) {
          await ref.read(gDaoProvider).breakStreak(curStreak);
        }
      } else {
        if (percent == 1) {
          await ref
              .read(gDaoProvider)
              .insertStreak(
                goalID,
                today,
                today.add(const Duration(days: 1)),
                today,
              );
          doCelebrate = true;
        }
      }
      return doCelebrate;
    }
  }

  /// Checks the progress of the fasting goal and returns a tuple containing the percentage, number of completed days, and total number of days in the week.
  Future<(double, int, int)> checkFastingGoalProgress() async {
    final goal = await ref.read(gDaoProvider).findActiveFastingGoal();

    if (goal == null) {
      return (0.0, 0, 0);
    }
    final curWeek = bookendWeek();
    final lastWeek = (
      curWeek.$1.subtract(const Duration(days: 7)),
      curWeek.$2.subtract(const Duration(days: 7)),
    );

    if (goal.metric == MetricType.hours) {
      final curDur = await ref
          .read(fDaoProvider)
          .getWeeksDuration(session!.userId, curWeek.$1, curWeek.$2);
      int numComplete = curDur.where((d) => d >= goal.threshold * 60).length;
      return ((numComplete / 7).clamp(0.05, 1.0), numComplete, 7);
    } else if (goal.metric == MetricType.days) {
      final curWeekDays = await ref
          .read(fDaoProvider)
          .findFastsInRange(curWeek.$1, curWeek.$2)
          .length;
      return ((curWeekDays / goal.threshold).clamp(0.05, 1.0), curWeekDays, goal.threshold.toInt());
    } else {
      final fiveTwoDays = session!.fiveTwoDaysSelected;

      int numCompleted = 0;
      for (final day in fiveTwoDays) {
        final date = lastWeek.$1.add(Duration(days: day));

        final amount = await ref.read(nDaoProvider).fiveTwoDayEvaluation(date);

        if (amount <= goal.threshold) numCompleted++;
      }

      return ((numCompleted / fiveTwoDays.length).clamp(0.05, 1.0), numCompleted, fiveTwoDays.length);
    }
  }

  /// Checks if the fasting goal has been met and returns a boolean indicating the result.
  Future<bool> checkFastingGoal() async {
    final goal = await ref.read(gDaoProvider).findActiveFastingGoal();

    if (goal == null) {
      return false;
    }
    int goalID = goal.goalID;
    DateTime today = DateTime.now();
    late double percent;
    final curWeek = bookendWeek();
    final lastWeek = (
      curWeek.$1.subtract(const Duration(days: 7)),
      curWeek.$2.subtract(const Duration(days: 7)),
    );
    bool doCelebrate = false;

    if (goal.metric == MetricType.hours) {
      final curDur = await ref
          .read(fDaoProvider)
          .getWeeksDuration(session!.userId, curWeek.$1, curWeek.$2);
      int numComplete = curDur.where((d) => d >= goal.threshold * 60).length;
      percent = numComplete / 7;
    } else if (goal.metric == MetricType.days) {
      final curWeekDays = await ref
          .read(fDaoProvider)
          .findFastsInRange(curWeek.$1, curWeek.$2)
          .length;
      percent = (curWeekDays / goal.threshold).clamp(0.05, 1.0);
    } else {
      final fiveTwoDays = session!.fiveTwoDaysSelected;

      int numCompleted = 0;
      for (final day in fiveTwoDays) {
        final date = lastWeek.$1.add(Duration(days: day));

        final amount = await ref.read(nDaoProvider).fiveTwoDayEvaluation(date);
        if (amount <= goal.threshold) numCompleted++;
      }
      percent = (numCompleted / fiveTwoDays.length).clamp(0.05, 1.0);
    }

    BasicStreak? curStreak = await ref
        .read(gDaoProvider)
        .checkActiveStreak(GoalType.fasting);

    if (curStreak != null) {
      if ((today.isAfter(curStreak.curPeriod) ||
              DateUtils.isSameDay(today, curStreak.curPeriod)) &&
          today.isBefore(curStreak.curPeriod.add(const Duration(days: 7)))) {
        if (DateUtils.dateOnly(
          today,
        ).isAfter(DateUtils.dateOnly(curStreak.lastPeriod))) {
          if (percent == 1) {
            curStreak.curPeriod = DateUtils.dateOnly(
              curWeek.$1.add(const Duration(days: 7)),
            );
            curStreak.lastPeriod = DateUtils.dateOnly(curWeek.$2);
            await ref.read(gDaoProvider).updateStreak(curStreak);
            doCelebrate = true;
          }
        }
      } else if (DateUtils.dateOnly(curStreak.curPeriod).isBefore(today)) {
        await ref.read(gDaoProvider).breakStreak(curStreak);
      }
    } else {
      if (percent == 1) {
        await ref
            .read(gDaoProvider)
            .insertStreak(
              goalID,
              today,
              DateUtils.dateOnly(curWeek.$1.add(const Duration(days: 7))),
              curWeek.$2,
            );
        doCelebrate = true;
      }
    }

    return doCelebrate;
  }

  /// Checks the progress of the weight goal and returns a tuple containing the start weight, completion percentage, and threshold.
  Future<(double, double, double)> checkWeightGoal() async {
    final goal = await ref.read(gDaoProvider).findActiveWeightGoal();

    if (goal == null) {
      return (-1.0, -1.0, -1.0);
    }
    int goalID = goal.goalID;
    late double percent;

    final curWeight = await ref
        .read(wDaoProvider)
        .getLatestWeight(session!.userId);

    percent =
        ((goal.startWeight - curWeight) / (goal.startWeight - goal.threshold))
            .clamp(0.05, 1.0);

    if (percent == 1) {
      ref.read(gDaoProvider).setComplete(true, goalID);
    }

    return (goal.startWeight, percent, goal.threshold);
  }

  /// Checks if the weight goal has been met and returns a boolean indicating the result.
  Future<(double, double, double)> checkHydrationGoalProgress() async {
    final goal = await ref.read(gDaoProvider).findActiveHydrationGoal();

    if (goal == null) {
      return (0.0, 0.0, 0.0);
    }

    final curWater = await ref
        .read(hDaoProvider)
        .getTodayHydration(session!.userId, DateTime.now());

    if (curWater == null) {
      return (0.0, 0.0, goal.threshold);
    } else {
      debugPrint('Water: $curWater');

      return ((curWater / goal.threshold).clamp(0.05, 1.0), curWater, goal.threshold);
    }
  }

  /// Checks if the hydration goal has been met and returns a boolean indicating the result.
  Future<bool> checkHydrationGoal() async {
    final goal = await ref.read(gDaoProvider).findActiveHydrationGoal();

    if (goal == null) {
      return false;
    }
    int goalID = goal.goalID;
    DateTime today = DateUtils.dateOnly(DateTime.now());
    late double percent;

    final curWater = await ref
        .read(hDaoProvider)
        .getTodayHydration(session!.userId, DateTime.now());

    if (curWater == null) {
      return false;
    } else {
      percent = (curWater / goal.threshold).clamp(0.05, 1.0);

      BasicStreak? curStreak = await ref
          .read(gDaoProvider)
          .checkActiveStreak(GoalType.hydration);
      bool doCelebrate = false;

      if (curStreak != null) {
        if (DateUtils.isSameDay(today, curStreak.curPeriod)) {
          if (today.isAfter(DateUtils.dateOnly(curStreak.lastPeriod))) {
            if (percent == 1) {
              curStreak.curPeriod = today.add(const Duration(days: 1));
              curStreak.lastPeriod = today;
              await ref.read(gDaoProvider).updateStreak(curStreak);
              doCelebrate = true;
            }
          }
        } else if (DateUtils.dateOnly(curStreak.curPeriod).isBefore(today)) {
          await ref.read(gDaoProvider).breakStreak(curStreak);
        }
      } else {
        if (percent == 1) {
          await ref
              .read(gDaoProvider)
              .insertStreak(
                goalID,
                today,
                today.add(const Duration(days: 1)),
                today,
              );
          doCelebrate = true;
        }
      }
      return doCelebrate;
    }
  }

  Future<bool> addHydration(int newAmount) async {
    await ref
        .read(hDaoProvider)
        .addHydration(session!.userId, DateTime.now(), newAmount / 1000);
    return await checkHydrationGoal();
  }

  Future<(double, double, double)> logWeight(double newAmount) async {
    await ref
        .read(wDaoProvider)
        .insertWeight(session!.userId, newAmount, DateTime.now());
    return await checkWeightGoal();
  }

  Future<bool> logMeal(
    MealCategory cate,
    // String? path,
    // String? comment,
    Set<MealFood> foods,
    LogMethod logMethod,
    DateTime date,
  ) async {
    // await ref
    //     .read(nDaoProvider)
    //     .insertFoodLog(cate, path, comment, logMethod, date);

    await ref.read(nDaoProvider).insertMealLog(cate, logMethod, date, foods);

    ref.invalidate(mealRangeProvider);

    return await checkNutritionGoal();
  }

  /// Inserts an initial fasting goal for the user with the specified threshold and metric type.
  Future<void> insertInitialFastinggoal(int userId, num threshold, MetricType mType) async {
    await ref.read(gDaoProvider).insertFastingGoal(userId, threshold.toDouble(), GoalOperator.greaterEqual, mType);
  }

  /// Inserts an initial hydration goal for the user with the specified threshold and start weight.
  Future<void> insertInitialHydrationgoal(int userId) async {
    await ref.read(gDaoProvider).insertHydrationGoal(userId, DateTime.now(), 1, GoalOperator.greaterEqual);
  }

  Future<void> insertGoal(BasicGoal newGoal) async {
    if (newGoal is FastingGoalModel) {
      await ref
          .read(gDaoProvider)
          .insertFastingGoal(
            session!.userId,
            newGoal.threshold,
            newGoal.op,
            newGoal.metric,
          );
      ref.invalidateSelf();
    } else if (newGoal is HydrationGoalModel) {
      await ref
          .read(gDaoProvider)
          .insertHydrationGoal(
            session!.userId,
            DateTime.now(),
            newGoal.threshold.toInt(),
            newGoal.op,
          );
      ref.invalidateSelf();
    } else if (newGoal is WeightGoalModel) {
      await ref
          .read(gDaoProvider)
          .insertWeightGoal(
            session!.userId,
            newGoal.threshold,
            newGoal.startWeight,
            newGoal.op,
          );
      ref.invalidateSelf();
    } else {
      await ref
          .read(gDaoProvider)
          .insertNutritionGoal(
            session!.userId,
            NutrientType.caloreis,
            newGoal.threshold,
          );
      ref.invalidateSelf();
    }
  }

  Future<void> changeGoal(BasicGoal changedGoal) async {
    await ref.read(gDaoProvider).updateGoal(changedGoal, session!.userId);
    ref.invalidateSelf();
    if (changedGoal is WeightGoalModel) ref.invalidate(checkWeightGoalProvider);
  }

  Future<void> finishGoal(int goalID) {
    return ref.read(gDaoProvider).finishGoal(goalID);
  }

  /// Checks if the user has met the specified health concern threshold within the given time window for the specified goal type.
  Future<bool> isValidConcern(GoalType type, int thr, int window) async {
    final startWindow = DateTime.now().subtract(Duration(days: window));
    final breaksInWindow = await ref
        .read(gDaoProvider)
        .evaluateConcerns(type, startWindow);
    return breaksInWindow >= thr;
  }

  /// Checks if the user has met the specified positive reinforcement threshold within the given time window for the specified goal type.
  Future<bool> isValidPR(GoalType type, int thr, int window) async {
    final startWindow = DateTime.now().subtract(Duration(days: window));
    final curLength = await ref
        .read(gDaoProvider)
        .evaluatePR(type, startWindow);
    return curLength >= thr;
  }
}

final asyncGoalsProvider = AsyncNotifierProvider<AsyncGoals, BasicGoal?>(
  AsyncGoals.new,
);
