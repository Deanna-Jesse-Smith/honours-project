import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
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

  Future<double> checkGoal(GoalType type) async {
    final session = ref.read(userSessionProvider).value;
    final week = bookendWeek();

    late bool? result;
    double percent = -1.0;
    int goalID = -1;
    late DateTime evalDay;
    bool isComplete = false;

    switch (type) {
      case GoalType.fasting:
        final goal = await ref.read(gDaoProvider).findActiveFastingGoal();

        if (goal == null) {
          result = null;
          break;
        }
        goalID = goal.goalID;
        evalDay = goal.lastEval;

        if (goal.metric == MetricType.hours) {
          final curDur = await ref.read(fDaoProvider).getCurDuration(0);
          if (curDur >= (goal.threshold * 60)) {
            result = true;
            break;
          }
          percent = curDur == 0 ? 0 : curDur / (goal.threshold * 60);
          result = false;
        } else if (goal.metric == MetricType.days) {
          final weekDays = await ref
              .read(fDaoProvider)
              .findFastsInRange(0, week.$1, week.$2)
              .length;

          if (weekDays >= goal.threshold) {
            result = true;
            break;
          }
          result = false;
          percent = weekDays / goal.threshold;
        } else {
          final fiveTwoDays = session!.fiveTwoDaysSelected;
          List<DateTime?> daysList = fiveTwoDays
              .map((d) => getFullDay(d))
              .toList();
          // daysList.removeWhere((d) => d == null);

          if (daysList.isEmpty) {
            result = false;
            break;
          }

          bool resultt = false;
          for (final day in daysList) {
            DateTime temp = day!.add(const Duration(days: 1));
            bool complete = await ref
                .read(nDaoProvider)
                .isFiveTwoDay(day, temp);

            if (!complete) {
              resultt = false;
              break;
            }
          }

          result = resultt;
        }
      case GoalType.weight:
        final goal = await ref.read(gDaoProvider).findActiveWeightGoal();

        if (goal == null) {
          result = null;
          break;
        }

        goalID = goal.goalID;
        evalDay = goal.lastEval;
        final curWeight = await ref.read(wDaoProvider).latestWeight(0);

        if (curWeight == null) {
          result = false;
          break;
        }

        result = goal.calculateComplete(curWeight);
        percent = goal.progress;
      case GoalType.hydration:
        final goal = await ref.read(gDaoProvider).findActiveHydrationGoal();

        final curWater = await ref
            .read(hDaoProvider)
            .getTodayHydration(0, DateTime.now());

        if (goal == null) {
          result = null;
          percent = curWater == null ? 0 : curWater / 1;
          break;
        }
        goalID = goal.goalID;
        evalDay = goal.lastEval;
        isComplete = goal.isComplete;

        if (curWater == null) {
          debugPrint('Water: null');
          result = false;
          percent = 0.0;
        } else {
          debugPrint('Water: $curWater');
          result = goal.calculateComplete(curWater);
          percent = curWater / goal.threshold;
        }

      case GoalType.nutrition:
        final goal = await ref.read(gDaoProvider).findActiveFoodGoal();

        if (goal == null) {
          result = null;
          break;
        }
        goalID = goal.goalID;
        evalDay = goal.lastEval;

        final mealCounts = await ref
            .read(nDaoProvider)
            .countMealsInRange(week.$1, week.$2);

        result = mealCounts.length < 7
            ? false
            : mealCounts.every((v) => v >= goal.threshold);
    }

    if (result != null) {
      if (type == GoalType.hydration) {
        DateTime today = DateTime.now();
        if (DateUtils.isSameDay(evalDay, today)) {

        } else if (isComplete && DateUtils.isSameDay(
              evalDay,
              today.subtract(const Duration(days: 1)),
            )) {
          BasicStreak? curStreak = await ref
              .read(gDaoProvider)
              .checkActiveStreak(type);
          curStreak!.lastEval = DateUtils.dateOnly(today);
          await ref.read(gDaoProvider).updateStreak(curStreak);
        } else if (today.compareTo(evalDay) > 1) {
          BasicStreak? curStreak = await ref
              .read(gDaoProvider)
              .checkActiveStreak(type);
              if (curStreak != null) await ref.read(gDaoProvider).breakStreak(curStreak);
        }
      }

      if (type != GoalType.weight) {
        if (type == GoalType.fasting &&
            !DateUtils.isSameDay(evalDay, week.$1)) {
          await updateStreak(type, goalID, result);
        } else if (type != GoalType.fasting &&
            !DateUtils.isSameDay(evalDay, DateTime.now())) {
          await updateStreak(type, goalID, result);
        }
      }

      if (result == true) {
        percent = 1;
        ref.read(gDaoProvider).setComplete(true, goalID);
      } else {
        percent = percent.clamp(0.0, 1.0);
        if (goalID > -1) ref.read(gDaoProvider).setComplete(false, goalID);
      }
    }

    return percent;
  }

  Future<double> checkHydrationGoal() async {
    late bool? result;
    double percent = -1.0;
    int goalID = -1;
    late DateTime evalDay;

    final goal = await ref.read(gDaoProvider).findActiveHydrationGoal();

    if (goal == null) {
      result = null;
      return 0;
    }
    goalID = goal.goalID;
    evalDay = goal.lastEval;

    final curWater = await ref
        .read(hDaoProvider)
        .getTodayHydration(0, DateTime.now());

    if (curWater == null) {
      debugPrint('Water: null');
      result = false;
      percent = 0.0;
    } else {
      debugPrint('Water: $curWater');
      result = goal.calculateComplete(curWater);
      percent = curWater / goal.threshold;
    }

    if (!DateUtils.isSameDay(evalDay, DateTime.now())) {
      await updateStreak(GoalType.hydration, goalID, result);
    }

    if (result == true) {
      percent = 1;
    } else {
      percent = percent.clamp(0.0, 1.0);
    }

    return percent;
  }

  Future<void> updateStreak(GoalType type, int goalID, bool result) async {
    BasicStreak? curStreak = await ref
        .read(gDaoProvider)
        .checkActiveStreak(type);

    final today = DateUtils.dateOnly(DateTime.now());

    if (curStreak == null && result) {
      await ref.read(gDaoProvider).insertStreak(goalID, today);
    } else if (curStreak != null) {
      curStreak.lastEval = DateUtils.dateOnly(today);

      if (result) {
        final expected = DateUtils.dateOnly(
          curStreak.start,
        ).add(Duration(days: curStreak.daysProgress));

        if (DateUtils.isSameDay(today, expected.subtract(Duration(days: 1))) ||
            DateUtils.isSameDay(today, expected)) {
          await ref.read(gDaoProvider).updateStreak(curStreak);
        } else {
          await ref.read(gDaoProvider).breakStreak(curStreak);
        }
      } else {
        await ref.read(gDaoProvider).breakStreak(curStreak);
      }
    }
  }

  Future<int> checkStreak(GoalType type, double curState) async {
    BasicStreak? curStreak = await ref
        .read(gDaoProvider)
        .checkActiveStreak(type);

    if (curStreak == null) return -1;

    final percent = curStreak.calculateProgress(curState);

    return percent;
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
}

final asyncGoalsProvider = AsyncNotifierProvider<AsyncGoals, BasicGoal?>(
  AsyncGoals.new,
);
