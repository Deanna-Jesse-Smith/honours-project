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

  Future<double> checkNutritionGoalPercent() async {
    final goal = await ref.read(gDaoProvider).findActiveFoodGoal();
    final curWeek = bookendWeek();
    final lastWeek = (
      curWeek.$1.subtract(const Duration(days: 7)),
      curWeek.$2.subtract(const Duration(days: 7)),
    );

    if (goal == null) {
      return -1;
    } else {
      final mealCounts = await ref
          .read(nDaoProvider)
          .countMealsInRange(lastWeek.$1, lastWeek.$2);

      return mealCounts.fold(
            0,
            (prev, cur) => prev + (cur >= goal.threshold ? 1 : 0),
          ) /
          7;
    }
  }

  Future<bool> checkNutritionGoal() async {
    final goal = await ref.read(gDaoProvider).findActiveFoodGoal();
    double percent = 0;
    int goalID = -1;
    final curWeek = bookendWeek();
    final lastWeek = (
      curWeek.$1.subtract(const Duration(days: 7)),
      curWeek.$2.subtract(const Duration(days: 7)),
    );
    DateTime today = DateTime.now();
    bool doCelebrate = false;

    if (goal == null) {
      percent = 0.0;
    } else {
      goalID = goal.goalID;

      final mealCounts = await ref
          .read(nDaoProvider)
          .countMealsInRange(lastWeek.$1, lastWeek.$2);

      percent =
          mealCounts.fold(
            0,
            (prev, cur) => prev + (cur >= goal.threshold ? 1 : 0),
          ) /
          7;
    }

    BasicStreak? curStreak = await ref
        .read(gDaoProvider)
        .checkActiveStreak(GoalType.nutrition);

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

  Future<double> checkFastingGoalProgress() async {
    final goal = await ref.read(gDaoProvider).findActiveFastingGoal();

    if (goal == null) {
      return 0.0;
    }
    // DateTime evalDay = goal.lastEval;
    final curWeek = bookendWeek();
    final lastWeek = (
      curWeek.$1.subtract(const Duration(days: 7)),
      curWeek.$2.subtract(const Duration(days: 7)),
    );
    // late bool lastWeekComplete;
    // bool alreadyEvaluated = evalDay == lastWeek.$2;

    if (goal.metric == MetricType.hours) {
      // if (!alreadyEvaluated) {
      //   final lastDur = await ref
      //       .read(fDaoProvider)
      //       .getWeeksDuration(session!.userId, lastWeek.$1, lastWeek.$2);
      //   int numLastComplete = lastDur
      //       .where((d) => d >= goal.threshold * 60)
      //       .length;
      //   lastWeekComplete = numLastComplete == 7;
      // }

      final curDur = await ref
          .read(fDaoProvider)
          .getWeeksDuration(session!.userId, curWeek.$1, curWeek.$2);
      int numComplete = curDur.where((d) => d >= goal.threshold * 60).length;
      return numComplete / 7;
    } else if (goal.metric == MetricType.days) {
      // if (!alreadyEvaluated) {
      //   final weekDays = await ref
      //       .read(fDaoProvider)
      //       .findFastsInRange(lastWeek.$1, lastWeek.$2)
      //       .length;

      //   if (weekDays >= goal.threshold) {
      //     lastWeekComplete = true;
      //   }
      // }

      final curWeekDays = await ref
          .read(fDaoProvider)
          .findFastsInRange(curWeek.$1, curWeek.$2)
          .length;
      return (curWeekDays / goal.threshold).clamp(0.0, 1.0);
    } else {
      final fiveTwoDays = session!.fiveTwoDaysSelected;

      // if (!alreadyEvaluated) {
      //   bool tempResult = false;
      //   for (final day in fiveTwoDays) {
      //     final date = lastWeek.$1.add(Duration(days: day));
      //     bool wasCompleted = await ref
      //         .read(nDaoProvider)
      //         .isFiveTwoDay(date, date.add(const Duration(days: 1)));

      //     if (!wasCompleted) {
      //       tempResult = false;
      //       break;
      //     }
      //   }
      //   lastWeekComplete = tempResult;
      // }

      int numCompleted = 0;
      for (final day in fiveTwoDays) {
        final date = lastWeek.$1.add(Duration(days: day));
        bool wasCompleted = await ref
            .read(nDaoProvider)
            .isFiveTwoDay(date, date.add(const Duration(days: 1)));

        if (wasCompleted) numCompleted++;
      }

      return (numCompleted / fiveTwoDays.length).clamp(0.0, 1.0);
    }
  }

  Future<bool> checkFastingGoal() async {
    final goal = await ref.read(gDaoProvider).findActiveFastingGoal();

    if (goal == null) {
      return false;
    }
    int goalID = goal.goalID;
    // DateTime evalDay = goal.lastEval;
    DateTime today = DateTime.now();
    late double percent;
    final curWeek = bookendWeek();
    final lastWeek = (
      curWeek.$1.subtract(const Duration(days: 7)),
      curWeek.$2.subtract(const Duration(days: 7)),
    );
    // late bool lastWeekComplete;
    // bool alreadyEvaluated = evalDay == lastWeek.$2;
    bool doCelebrate = false;

    if (goal.metric == MetricType.hours) {
      // if (!alreadyEvaluated) {
      //   final lastDur = await ref
      //       .read(fDaoProvider)
      //       .getWeeksDuration(session!.userId, lastWeek.$1, lastWeek.$2);
      //   int numLastComplete = lastDur
      //       .where((d) => d >= goal.threshold * 60)
      //       .length;
      //   lastWeekComplete = numLastComplete == 7;
      // }

      final curDur = await ref
          .read(fDaoProvider)
          .getWeeksDuration(session!.userId, curWeek.$1, curWeek.$2);
      int numComplete = curDur.where((d) => d >= goal.threshold * 60).length;
      percent = numComplete / 7;
    } else if (goal.metric == MetricType.days) {
      // if (!alreadyEvaluated) {
      //   final weekDays = await ref
      //       .read(fDaoProvider)
      //       .findFastsInRange(lastWeek.$1, lastWeek.$2)
      //       .length;

      //   if (weekDays >= goal.threshold) {
      //     lastWeekComplete = true;
      //   }
      // }

      final curWeekDays = await ref
          .read(fDaoProvider)
          .findFastsInRange(curWeek.$1, curWeek.$2)
          .length;
      percent = (curWeekDays / goal.threshold).clamp(0.0, 1.0);
    } else {
      final fiveTwoDays = session!.fiveTwoDaysSelected;

      // if (!alreadyEvaluated) {
      //   bool tempResult = false;
      //   for (final day in fiveTwoDays) {
      //     final date = lastWeek.$1.add(Duration(days: day));
      //     bool wasCompleted = await ref
      //         .read(nDaoProvider)
      //         .isFiveTwoDay(date, date.add(const Duration(days: 1)));

      //     if (!wasCompleted) {
      //       tempResult = false;
      //       break;
      //     }
      //   }
      //   lastWeekComplete = tempResult;
      // }

      int numCompleted = 0;
      for (final day in fiveTwoDays) {
        final date = lastWeek.$1.add(Duration(days: day));
        bool wasCompleted = await ref
            .read(nDaoProvider)
            .isFiveTwoDay(date, date.add(const Duration(days: 1)));

        if (wasCompleted) numCompleted++;
      }

      percent = (numCompleted / fiveTwoDays.length).clamp(0.0, 1.0);

      // List<DateTime?> daysList = fiveTwoDays.map((d) => getFullDay(d)).toList();
      // daysList.removeWhere((d) => d == null);

      // if (daysList.isEmpty) {
      //   lastWeekComplete = false;
      // }

      // bool resultt = false;
      // for (final day in daysList) {
      //   DateTime temp = day!.add(const Duration(days: 1));
      //   bool complete = await ref.read(nDaoProvider).isFiveTwoDay(day, temp);

      //   if (!complete) {
      //     resultt = false;
      //     break;
      //   }
      // }
      // lastWeekComplete = resultt;
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

    // if (!alreadyEvaluated) {
    //   if (lastWeekComplete) {
    //     BasicStreak? curStreak = await ref
    //         .read(gDaoProvider)
    //         .checkActiveStreak(GoalType.fasting);

    //     if (curStreak == null) {
    //       await ref.read(gDaoProvider).insertStreak(goalID, today, curWeek.$2);
    //     } else {
    //       curStreak.lastEval = DateUtils.dateOnly(today);
    //       await ref.read(gDaoProvider).updateStreak(curStreak);
    //     }
    //   } else {
    //     BasicStreak? curStreak = await ref
    //         .read(gDaoProvider)
    //         .checkActiveStreak(GoalType.fasting);

    //     if (curStreak != null) {
    //       await ref.read(gDaoProvider).breakStreak(curStreak);
    //     }
    //   }
    // }

    return doCelebrate;
  }

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
            .clamp(0.1, 1.0);

    if (percent == 1) {
      ref.read(gDaoProvider).setComplete(true, goalID);
    }

    return (goal.startWeight, percent, goal.threshold);
  }

  Future<double> checkHydrationGoalProgress() async {
    final goal = await ref.read(gDaoProvider).findActiveHydrationGoal();

    if (goal == null) {
      return 0.0;
    }

    final curWater = await ref
        .read(hDaoProvider)
        .getTodayHydration(session!.userId, DateTime.now());

    if (curWater == null) {
      return 0.0;
    } else {
      debugPrint('Water: $curWater');

      return (curWater / goal.threshold).clamp(0.0, 1.0);
    }
  }

  Future<bool> checkHydrationGoal() async {
    final goal = await ref.read(gDaoProvider).findActiveHydrationGoal();

    if (goal == null) {
      return false;
    }
    int goalID = goal.goalID;
    DateTime today = DateTime.now();
    late double percent;

    final curWater = await ref
        .read(hDaoProvider)
        .getTodayHydration(session!.userId, DateTime.now());

    if (curWater == null) {
      return false;
    } else {
      percent = (curWater / goal.threshold).clamp(0.0, 1.0);

      BasicStreak? curStreak = await ref
          .read(gDaoProvider)
          .checkActiveStreak(GoalType.hydration);
      bool doCelebrate = false;

      if (curStreak != null) {
        if (DateUtils.isSameDay(today, curStreak.curPeriod)) {
          if (DateUtils.dateOnly(
            today,
          ).isAfter(DateUtils.dateOnly(curStreak.lastPeriod))) {
            if (percent == 1) {
              curStreak.curPeriod = DateUtils.dateOnly(
                today.add(const Duration(days: 1)),
              );
              curStreak.lastPeriod = DateUtils.dateOnly(today);
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
          // ref.invalidate(checkHydrationStreakProvider);
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

  Future<void> logMeal(
    MealCategory cate,
    String? path,
    String? comment,
    LogMethod logMethod,
    DateTime date,
  ) async {
    await ref
        .read(nDaoProvider)
        .insertFoodLog(cate, path, comment, logMethod, date);
  }

  // Future<void> updateStreak(GoalType type, int goalID, bool result) async {
  //   BasicStreak? curStreak = await ref
  //       .read(gDaoProvider)
  //       .checkActiveStreak(type);

  //   final today = DateUtils.dateOnly(DateTime.now());

  //   if (curStreak == null && result) {
  //     await ref.read(gDaoProvider).insertStreak(goalID, today);
  //   } else if (curStreak != null) {
  //     curStreak.lastEval = DateUtils.dateOnly(today);

  //     if (result) {
  //       final expected = DateUtils.dateOnly(
  //         curStreak.start,
  //       ).add(Duration(days: curStreak.daysProgress));

  //       if (DateUtils.isSameDay(today, expected.subtract(Duration(days: 1))) ||
  //           DateUtils.isSameDay(today, expected)) {
  //         await ref.read(gDaoProvider).updateStreak(curStreak);
  //       } else {
  //         await ref.read(gDaoProvider).breakStreak(curStreak);
  //       }
  //     } else {
  //       await ref.read(gDaoProvider).breakStreak(curStreak);
  //     }
  //   }
  // }

  Future<int> checkStreak(GoalType type, double curState) async {
    BasicStreak? curStreak = await ref
        .read(gDaoProvider)
        .checkActiveStreak(type);

    if (curStreak == null) return -1;

    final percent = curStreak.calculateProgress(curState);

    return percent;
  }

  Future<void> insertInitialFastinggoal(int userId, num threshold, MetricType mType) async {
    await ref.read(gDaoProvider).insertFastingGoal(userId, threshold.toDouble(), GoalOperator.greaterEqual, mType);
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
      // ref.invalidate(checkFastingGoalProvider);
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
      // ref.invalidate(checkHydrationGoalProvider);
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
      // ref.invalidate(checkWeightGoalProvider);
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

  Future<bool> isValidConcern(GoalType type, int thr, int window) async {
    final startWindow = DateTime.now().subtract(Duration(days: window));
    final breaksInWindow = await ref
        .read(gDaoProvider)
        .evaluateConcerns(type, startWindow);
    return breaksInWindow >= thr;
  }

  Future<bool> isValidPR(GoalType type, int thr, int window) async {
    final startWindow = DateTime.now().subtract(Duration(days: window));
    final breaksInWindow = await ref
        .read(gDaoProvider)
        .evaluateConcerns(type, startWindow);
    return breaksInWindow <= thr;
  }
}

final asyncGoalsProvider = AsyncNotifierProvider<AsyncGoals, BasicGoal?>(
  AsyncGoals.new,
);
