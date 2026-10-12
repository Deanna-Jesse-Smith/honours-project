import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/fasting_schedule.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/FastingPlan.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/suggestions.dart';
import 'package:testrun/utils/user_state.dart';

@riverpod
class AsyncFasting extends AsyncNotifier<FastingForm> {
  late UserSessionData? session;
  @override
  Future<FastingForm> build() {
    session = ref.watch(userSessionProvider).value;
    return Future.value(FastingForm.tre);
  }

  /// Toggles the fasting form for the user and updates the corresponding user session data. If the current fasting form is TRE, it changes to 5:2, and vice versa. The method also updates the user session provider with the new fasting form.
  Future<void> handleChangingForms(
    FastingForm newForm,
    TimeOfDay start,
    TimeOfDay end,
    List<bool> daysADF,
    List<bool> days52,
  ) async {
    final session = ref.read(userSessionProvider).value;

    DateTime today = DateTime.now();
    switch (newForm) {
      case FastingForm.tre:
        await ref
            .read(uDaoProvider)
            .changeToTRE(
              session!.userId,
              start.convertToDateTime(today),
              end.convertToDateTime(today),
            );
            int threshold = session.endTime.difference(session.startTime).inHours.abs() - 1;
            await ref
                  .read(asyncGoalsProvider.notifier)
                  .insertInitialFastinggoal(session.userId, threshold, MetricType.hours);
      case FastingForm.fiveTwo:
        await ref
            .read(uDaoProvider)
            .changeTo52(session!.userId, boolsToInts(days52));

            await ref
                  .read(asyncGoalsProvider.notifier)
                  .insertInitialFastinggoal(session.userId, 700, MetricType.hours);
      case FastingForm.adf:
      final tempDays = boolsToInts(daysADF);
        await ref
            .read(uDaoProvider)
            .changeToADF(session!.userId, tempDays);

            await ref
                  .read(asyncGoalsProvider.notifier)
                  .insertInitialFastinggoal(session.userId, tempDays.length, MetricType.hours);
    }

    AsyncGoals tempGoals = ref.read(asyncGoalsProvider.notifier);
    BasicGoal? tempGoal = await ref.read(gDaoProvider).findActiveFastingGoal();
    if (tempGoal != null) await tempGoals.finishGoal(tempGoal.goalID);

    final checkCurFast = await ref.read(fDaoProvider).isFasting(session.userId);

    if (checkCurFast) {
      await toggleFast();
    }
    ref.invalidate(userSessionProvider);
  }

  void changeDays(bool forADF, List<bool> days) {
    final sessionNot = ref.read(userSessionProvider.notifier);
    if (forADF) {
      sessionNot.updateADF(boolsToInts(days));
    } else {
      sessionNot.update52(boolsToInts(days));
    }
  }

  Future<FastingStatus> refreshFastingStatus() async {
    final cur = ref.watch(userSessionProvider).value;
    if (cur == null) return FastingStatus.notFastingDay;

    final fDao = ref.read(fDaoProvider);
    final now = DateTime.now();
    final curStart = await fDao.getLatestStart(cur.userId);
    List<int> days = switch (cur.fastingForm) {
      FastingForm.tre => [],
      FastingForm.fiveTwo => cur.fiveTwoDaysSelected,
      FastingForm.adf => cur.adfDaysSelected,
    };

    return determineFastingStatus(
      now: now,
      user: DummyUser(days, cur.fastingForm, cur.startTime, cur.endTime),
      activeLogStart: curStart,
    );
  }

  bool validateTREplan(TimeOfDay start, TimeOfDay end) {
    final length = Duration(
      minutes: (end.hour * 60 + end.minute) - (start.hour * 60 + start.minute),
    );

    int maxLength = session!.experience == Experience.beginner ? 840 : 1200;
    bool isValid = length.inMinutes <= maxLength;

    return isValid;
  }

  bool validateADFplan(List<bool> daysADF) {
    final intDaysADF = boolsToInts(daysADF);
    final availability = RecommendationSystem.validCombosHelper(
      intDaysADF,
      true,
    );
    availability.removeWhere((a) => a.isEmpty || a.length != 3);
    if (availability.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool validate52plan(List<bool> days52) {
    final intDays52 = boolsToInts(days52);
    // debugPrint('Raw: ${intDays52.toString()}');
    final availability = RecommendationSystem.validCombosHelper(
      intDays52,
      false,
    );
    availability.removeWhere((a) => a.isEmpty || a.length != 2);
    // for (final av in availability) {
    //   debugPrint('Option: ${av.toString()}');
    // }
    if (availability.length != 1) {
      return false;
    } else {
      return true;
    }
  }

  Future<FastingProgress> refreshProgress() async {
    final cur = ref.watch(userSessionProvider).value;
    final fDao = ref.read(fDaoProvider);
    final now = DateTime.now();
    final curStart = await fDao.getLatestStart(cur!.userId);

    List<int> days = switch (cur.fastingForm) {
      FastingForm.tre => [],
      FastingForm.fiveTwo => cur.fiveTwoDaysSelected,
      FastingForm.adf => cur.adfDaysSelected,
    };

    return calculateFastingProgress(
      now: now,
      user: DummyUser(days, cur.fastingForm, cur.startTime, cur.endTime),
      activeStart: curStart,
    );
  }

  /// Toggles the fasting state for the user, either starting or breaking a fast based on the current fasting status. It evaluates the timing of the fast (start or end) against the expected fasting schedule and records the result in the database. The method also updates the user session provider to reflect the new fasting state.
  Future<void> toggleFast() async {
    final cur = ref.read(userSessionProvider).value;
    if (cur == null) return;

    final fDao = ref.read(fDaoProvider);

    final lastFast = await fDao.isFasting(cur.userId);
    DateTime today = DateTime.now();

    late final DateTime expectedStart;
    late final DateTime expectedEnd;
    switch (cur.fastingForm) {
      case FastingForm.tre:
        (expectedStart, expectedEnd) = treTimes(today, cur.startTime, cur.endTime);
        break;
      case FastingForm.fiveTwo:
        throw UnimplementedError();
      case FastingForm.adf:
        if (lastFast) {
          final activeStart = await fDao.getLatestStart(cur.userId);
          if (activeStart == null) return;
          (expectedStart, expectedEnd) = adfTimesForActiveFast(activeStart);
        } else {
          (expectedStart, expectedEnd) = adfTimes(cur.adfDaysSelected, today);
        }
        break;
    }

    // debugPrint('Expected Fasting Times (S:E) today: ($expectedStart — $expectedEnd)   $today');

    if (lastFast) {
      final (result, severity) = evaluateTiming(
        today,
        expectedEnd,
        FastResult.earlyEnd,
        FastResult.lateEnd,
        cur.fastingForm == FastingForm.adf,
        isStart: false,
      );

      // debugPrint('Fast Results: $result of severity $severity');

      await fDao.breakFast(cur.userId, today, result, severity);
    } else {
      final (result, severity) = evaluateTiming(
        today,
        expectedStart,
        FastResult.earlyStart,
        FastResult.lateStart,
        cur.fastingForm == FastingForm.adf,
      );
      
      // debugPrint('Fast Results: $result of severity $severity');

      await fDao.startFast(
        cur.userId,
        cur.fastingForm,
        today,
        result,
        severity,
      );
    }
    ref.invalidateSelf();
  }

  (DateTime, DateTime) treTimes(DateTime today, DateTime startTime, DateTime endTime) {
      final tempToday = today.add(const Duration(days: 1));
      return (DateTime(
          today.year,
          today.month,
          today.day,
          endTime.hour,
          endTime.minute,
        ),
        DateTime(
          tempToday.year,
          tempToday.month,
          tempToday.day,
          startTime.hour,
          startTime.minute,
        ),);
    }

  (DateTime, DateTime) adfTimes(List<int> days, DateTime today) {
    final candidates = days.map(getFullDay).toList()..sort();
    final nextFastDay = candidates.first;
    final start = nextFastDay
        .subtract(const Duration(days: 1))
        .copyWith(hour: 20);
    return (start, start.add(const Duration(days: 1)).copyWith(hour: 10));
  }

  (DateTime, DateTime) adfTimesForActiveFast(DateTime activeStart) {
    final plannedStart = DateTime(
      activeStart.year,
      activeStart.month,
      activeStart.day,
      20,
    );
    final expectedEnd = plannedStart
        .add(const Duration(days: 2))
        .copyWith(hour: 10, minute: 0);

    return (plannedStart, expectedEnd);
  }

  DateTime getFullDay(int dayOfWeek) {
    dayOfWeek++;
    DateTime now = DateTime.now();

    final diff = (dayOfWeek - now.weekday) % 7;

    return DateUtils.dateOnly(now.add(Duration(days: diff)));
  }

  /// Evaluates the timing of a fast (start or end) based on the actual and expected times, returning a FastResult and the severity of the timing difference in minutes. The evaluation considers whether the fasting form is ADF (Alternate Day Fasting) and whether the evaluation is for the start or end of the fast.
  (FastResult, int) evaluateTiming(
    DateTime actual,
    DateTime expected,
    FastResult earlyResult,
    FastResult lateResult,
    bool isADF, {
    bool isStart = true,
  }) {
    final difference = actual.difference(expected).inMinutes;
    if (!isADF) {
      if (difference.abs() <= 30) {
        return (FastResult.asPlanned, 0);
      }

      if (difference < 0) {
        return (earlyResult, difference.abs());
      }
      return (lateResult, difference);
    } else {
      if (isStart) {
        if (difference < 0) {
          return (earlyResult, difference.abs());
        } else if (difference <= 240) {
          return (FastResult.asPlanned, 0);
        }
        return (lateResult, difference);
      } else {
        if (difference <= 0 && difference >= -600) {
          return (FastResult.asPlanned, 0);
        } else if (difference < 0) {
          return (earlyResult, difference.abs());
        }
        return (lateResult, difference);
      }
    }
  }

  /// Checks if the user is currently in an eating window based on their fasting schedule and the current time. It retrieves the user's session data and checks if they are currently fasting. If they are fasting, it returns true; otherwise, it returns false.
  Future<bool> isInEatingWindow(BuildContext context) async {
    final cur = ref.read(userSessionProvider).value;
    if (cur == null) return false;

    final fDao = ref.read(fDaoProvider);

    final lastFast = await fDao.isFasting(cur.userId);

    if (lastFast) {
      return true;
    }
    return false;
  }

  List<bool> intsToBools(List<int> days, List<bool> list) {
    list.fillRange(0, 6, false);
    for (int day in days) {
      list[day] = true;
    }
    return list;
  }

  List<int> boolsToInts(List<bool> days) => [
    for (int loop = 0; loop < days.length; loop++)
      if (days[loop]) loop,
  ];
}

final asyncFatingNotifier = AsyncNotifierProvider<AsyncFasting, FastingForm>(
  AsyncFasting.new,
);
