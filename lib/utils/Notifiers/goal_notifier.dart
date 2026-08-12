import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/user_state.dart';

// final goalLogic = AsyncNotifierProvider<AsyncGoals, BasicGoal>(AsyncGoals.new);

@riverpod
class AsyncGoals extends AsyncNotifier<BasicGoal?> {
  late UserSessionData? session;
  @override
  Future<BasicGoal?> build() {
    session = ref.watch(userSessionProvider).value;
    return ref.read(gDaoProvider).findActiveFastingGoal();
  }

  Future<BasicGoal?> findGoal(GoalType type) {
    return ref.read(gDaoProvider).findActiveGoal(type);
  }

  (DateTime, DateTime) bookendWeek() {
    DateTime today = DateTime.now();

    DateTime start = today.subtract(Duration(days: findMonday(today.weekday, 0)));
    DateTime end = start.add(const Duration(days: 6));

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
    
    switch (type) {
      case GoalType.fasting:
        final goal = await ref.watch(gDaoProvider).findActiveFastingGoal();

        if (goal == null) {
          result = null;
          break;
        }

        if (goal.metric == MetricType.hours) {
          final curDur = await ref.read(fDaoProvider).getCurDuration(0);

          if (curDur >= (goal.threshold * 60)) {
            result = true;
            break;
          }
          percent = (goal.threshold * 60) / curDur;
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
          percent = goal.threshold / weekDays;
        } else {
          final fiveTwoDays = session!.fiveTwoDaysSelected;
          List<DateTime?> daysList = fiveTwoDays.map((d) => getFullDay(d)).toList();
          daysList.removeWhere((d) => d == null);

          bool resultt = false;
          for (final day in daysList) {
            DateTime temp = day!.add(const Duration(days: 1));
            resultt = await ref.read(nDaoProvider).isFiveTwoDay(day, temp);
          }
          
          result = resultt;
        }
      case GoalType.weight:
        final goal = await ref.watch(gDaoProvider).findActiveWeightGoal();

        if (goal == null) {
          result = null;
          break;
        }

        final curWeight = await ref.watch(wDaoProvider).latestWeight(0);

        if (curWeight == null) {
          result = false;
          break;
        }

        result = goal.calculateComplete(curWeight);
        // percent = 
      case GoalType.hydration:
        final goal = await ref.watch(gDaoProvider).findActiveHydrationGoal();

        if (goal == null) {
          result = null;
          break;
        }

        final curWater = await ref
            .read(hDaoProvider)
            .getTodayHydration(0, DateTime.now());

        result = goal.calculateComplete(curWater);
        percent = curWater / goal.threshold;
      case GoalType.nutrition:
        final goal = await ref.watch(gDaoProvider).findActiveFoodGoal();

        if (goal == null) {
          result = null;
          break;
        }

        final mealCounts = await ref.watch(nDaoProvider).countMealsInRange(week.$1, week.$2);

        result = mealCounts.every((v) => v > goal.threshold);
        // percent = mealCounts
    }

    if (result != null && result) {
      updateStreak(type);
      percent = 1;
    }

    return percent;
  }

  Future<void> updateStreak(GoalType type) async {
    BasicStreak? curStreak = await ref.read(gDaoProvider).checkActiveStreak(type);

    if (curStreak != null) {
      curStreak.increment();
      ref.read(gDaoProvider).updateStreak(curStreak);
    }
  }

  Future<int> checkStreak(GoalType type, double curState) async {
    BasicStreak? curStreak = await ref.watch(gDaoProvider).checkActiveStreak(type);

    if (curStreak == null) return -1;

    final percent = curStreak.calculateProgress(curState);

    return percent;
  }

  Future<void> insertGoal(BasicGoal newGoal) {
    if (newGoal is FastingGoalModel) {
      return ref.read(gDaoProvider).insertFastingGoal(session!.userId, newGoal.threshold, newGoal.op, newGoal.metric);
    } else if (newGoal is HydrationGoalModel) {
      return ref.read(gDaoProvider).insertHydrationStreak(session!.userId, DateTime.now(), newGoal.threshold.toInt(), newGoal.op);
    } else if (newGoal is WeightGoalModel) {
      return ref.read(gDaoProvider).insertWeightGoal(session!.userId, newGoal.threshold, newGoal.startWeight, newGoal.op);
    } else {
      return ref.read(gDaoProvider).insertNutritionStreak(session!.userId, NutrientType.caloreis, newGoal.threshold.toInt());
    }
  }

  Future<void> changeGoal(BasicGoal changedGoal) async {
    return ref.read(gDaoProvider).updateGoal(changedGoal);
  }

  Future<void> finishGoal(int goalID, {int streakID = -1}) {
    return ref.read(gDaoProvider).finishGoal(goalID, streakID);
  }
}

final asyncGoalsProvider = AsyncNotifierProvider<AsyncGoals, BasicGoal?>(AsyncGoals.new);