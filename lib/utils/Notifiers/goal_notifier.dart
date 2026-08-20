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
    return FastingGoalModel(0, 0, 0, GoalOperator.logOnly, MetricType.hours);
  }

  Future<BasicGoal?> findGoal(GoalType type) {
    return ref.read(gDaoProvider).findActiveGoal(type);
  }

  (DateTime, DateTime) bookendWeek() {
    DateTime today = DateUtils.dateOnly(DateTime.now());

    DateTime start = today.subtract(Duration(days: findMonday(today.weekday, 0)));
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
    
    switch (type) {
      case GoalType.fasting:
        final goal = await ref.read(gDaoProvider).findActiveFastingGoal();

        if (goal == null) {
          result = null;
          break;
        }
        goalID = goal.goalID;

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
          List<DateTime?> daysList = fiveTwoDays.map((d) => getFullDay(d)).toList();
          // daysList.removeWhere((d) => d == null);

          if (daysList.isEmpty) {
            result = false;
            break;
          }

          bool resultt = false;
          for (final day in daysList) {
            DateTime temp = day!.add(const Duration(days: 1));
            bool complete = await ref.read(nDaoProvider).isFiveTwoDay(day, temp);

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
        final curWeight = await ref.read(wDaoProvider).latestWeight(0);

        if (curWeight == null) {
          result = false;
          break;
        }

        result = goal.calculateComplete(curWeight);
        percent = goal.progress;
      case GoalType.hydration:
        final goal = await ref.read(gDaoProvider).findActiveHydrationGoal();

        if (goal == null) {
          result = null;
          break;
        }
        goalID = goal.goalID;

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
        
      case GoalType.nutrition:
        final goal = await ref.read(gDaoProvider).findActiveFoodGoal();

        if (goal == null) {
          result = null;
          break;
        }
        goalID = goal.goalID;

        final mealCounts = await ref.read(nDaoProvider).countMealsInRange(week.$1, week.$2);

        result = mealCounts.length < 7 ? false : mealCounts.every((v) => v >= goal.threshold);
    }

    if (result != null) {
      await updateStreak(type, goalID, result);
      if (result == true) {
        percent = 1;
      } else {
        percent = percent.clamp(0.0, 1.0);
      }
    }

    return percent;
  }

  // Future<void> evaluateStreak() {

  // }

  Future<void> updateStreak(GoalType type, int goalID, bool result) async {
    BasicStreak? curStreak = await ref.read(gDaoProvider).checkActiveStreak(type);
    if (curStreak == null && result && type != GoalType.weight) {
      await ref.read(gDaoProvider).insertStreak(goalID);
    } else if (curStreak != null) {
      if (result) {
        final today = DateUtils.dateOnly(DateTime.now());
        final expected = DateUtils.dateOnly(curStreak.start).add(Duration(days: curStreak.daysProgress));

        if (today == expected.subtract(Duration(days: 1)) || today == expected) {
          await ref.read(gDaoProvider).updateStreak(curStreak);
        } else {
          await ref.read(gDaoProvider).breakStreak(curStreak.streakID);
        }
      } else {
        await ref.read(gDaoProvider).breakStreak(curStreak.streakID);
      }
    }
  }

  // Future<void> breakStreak(GoalType type) async {
  //   BasicStreak? curStreak = await ref.read(gDaoProvider).checkActiveStreak(type);

  //   if (curStreak != null) ref.read(gDaoProvider).breakStreak(curStreak);
  // }

  Future<int> checkStreak(GoalType type, double curState) async {
    BasicStreak? curStreak = await ref.read(gDaoProvider).checkActiveStreak(type);

    if (curStreak == null) return -1;

    final percent = curStreak.calculateProgress(curState);

    return percent;
  }

  Future<void> insertGoal(BasicGoal newGoal) {
    if (newGoal is FastingGoalModel) {
      return ref.read(gDaoProvider).insertFastingGoal(session!.userId, newGoal.threshold, newGoal.op, newGoal.metric);
    } else if (newGoal is HydrationGoalModel) {
      return ref.read(gDaoProvider).insertHydrationGoal(session!.userId, DateTime.now(), newGoal.threshold.toInt(), newGoal.op);
    } else if (newGoal is WeightGoalModel) {
      return ref.read(gDaoProvider).insertWeightGoal(session!.userId, newGoal.threshold, newGoal.startWeight, newGoal.op);
    } else {
      return ref.read(gDaoProvider).insertNutritionGoal(session!.userId, NutrientType.caloreis, newGoal.threshold);
    }
  }

  Future<void> changeGoal(BasicGoal changedGoal) async {
    return ref.read(gDaoProvider).updateGoal(changedGoal, session!.userId);
  }

  Future<void> finishGoal(int goalID) {
    return ref.read(gDaoProvider).finishGoal(goalID);
  }
}

final asyncGoalsProvider = AsyncNotifierProvider<AsyncGoals, BasicGoal?>(AsyncGoals.new);