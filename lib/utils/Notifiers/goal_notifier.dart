import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/user_state.dart';

// final goalLogic = AsyncNotifierProvider<AsyncGoals, BasicGoal>(AsyncGoals.new);

class AsyncGoals extends AsyncNotifier<BasicGoal?> {
  @override
  Future<BasicGoal?> build() {
    return ref.read(gDaoProvider).findActiveFastingGoal();
  }

  Future<void> updateGoal(BasicGoal goal) async {
    // state = const AsyncValue.loading();
    ref.read(gDaoProvider).updateGoal(goal);
    // state = const AsyncValue.data(value)
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

  Future<bool?> checkGoal(GoalType type) async {
    final session = ref.read(userSessionProvider).value;
    final week = bookendWeek();
    
    switch (type) {
      case GoalType.fasting:
        final goal = await ref.watch(gDaoProvider).findActiveFastingGoal();

        if (goal == null) return null;

        if (goal.metric == MetricType.hours) {
          final curDur = await ref.read(fDaoProvider).getCurDuration(0);

          if (curDur >= (goal.threshold * 60)) return true;
          return false;
        } else if (goal.metric == MetricType.days) {
          final weekDays = await ref
              .read(fDaoProvider)
              .findFastsInRange(0, week.$1, week.$2)
              .length;

          if (weekDays >= goal.threshold) return true;
          return false;
        } else {
          final fiveTwoDays = session!.fiveTwoDaysSelected;
          List<DateTime?> daysList = fiveTwoDays.map((d) => getFullDay(d)).toList();
          daysList.removeWhere((d) => d == null);

          bool result = false;
          for (final day in daysList) {
            DateTime temp = day!.add(const Duration(days: 1));
            result = await ref.read(nDaoProvider).isFiveTwoDay(day, temp);
          }
          
          return result;
        }
      case GoalType.weight:
        final goal = await ref.watch(gDaoProvider).findActiveWeightGoal();

        if (goal == null) return null;

        final curWeight = await ref.read(wDaoProvider).latestWeight(0);

        if (curWeight == null) return false;

        return goal.calculateComplete(curWeight);
      case GoalType.hydration:
        final goal = await ref.watch(gDaoProvider).findActiveHydrationGoal();

        if (goal == null) return null;

        final curWater = await ref
            .read(hDaoProvider)
            .getTodayHydration(0, DateTime.now());

        double sum = 0;

        for (var log in curWater) {
          sum += log.amount;
        }

        return goal.calculateComplete(sum);
      case GoalType.nutrition:
        final goal = await ref.read(gDaoProvider).findActiveFoodGoal();

        if (goal == null) return null;

        final mealCounts = await ref.read(nDaoProvider).countMealsInRange(week.$1, week.$2);

        return mealCounts.every((v) => v > goal.threshold);
    }
  }

  // Future<void> checkStreak(GoalType type) {
    
  // }
}
