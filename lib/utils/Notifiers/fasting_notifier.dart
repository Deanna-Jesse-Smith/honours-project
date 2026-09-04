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
import 'package:testrun/widgets/dialogs.dart';

@riverpod
class AsyncFasting extends AsyncNotifier<FastingForm> {
  late UserSessionData? session;
  @override
  Future<FastingForm> build() {
    session = ref.watch(userSessionProvider).value;
    return Future.value(FastingForm.tre);
  }

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
      case FastingForm.fiveTwo:
        await ref
            .read(uDaoProvider)
            .changeTo52(session!.userId, boolsToInts(days52));
      case FastingForm.adf:
        await ref
            .read(uDaoProvider)
            .changeToADF(session!.userId, boolsToInts(daysADF));
    }

    AsyncGoals tempGoals = ref.read(asyncGoalsProvider.notifier);
    BasicGoal? tempGoal = await ref.read(gDaoProvider).findActiveFastingGoal();
    if (tempGoal != null) await tempGoals.finishGoal(tempGoal.goalID);

    if (session.isFasting) {
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
      FastingForm.fiveTwo => cur.adfDaysSelected,
      FastingForm.adf => cur.fiveTwoDaysSelected,
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

  // bool validatePlan(
  //   FastingForm form,
  //   TimeOfDay start,
  //   TimeOfDay end,
  //   List<bool> daysADF,
  //   List<bool> days52,
  // ) {
  //   switch (form) {
  //     case FastingForm.tre:
  //       final length = Duration(
  //         minutes:
  //             (end.hour * 60 + end.minute) - (start.hour * 60 + start.minute),
  //       );

  //       int maxLength = session!.experience == Experience.beginner ? 840 : 1200;
  //       bool isValid = length.inMinutes <= maxLength;

  //       return isValid;
  //     case FastingForm.fiveTwo:
  //       final availability = RecommendationSystem.validCombosHelper(
  //         boolsToInts(days52),
  //         false,
  //       );
  //       if (availability.isEmpty) {
  //         return false;
  //       } else {
  //         return true;
  //       }
  //     case FastingForm.adf:
  //       final availability = RecommendationSystem.validCombosHelper(
  //         boolsToInts(daysADF),
  //         true,
  //       );
  //       if (availability.isEmpty) {
  //         return false;
  //       } else {
  //         return true;
  //       }
  //   }
  // }

  Future<FastingProgress> refreshProgress() async {
    final cur = ref.watch(userSessionProvider).value;
    final fDao = ref.read(fDaoProvider);
    final now = DateTime.now();
    final curStart = await fDao.getLatestStart(cur!.userId);

    List<int> days = switch (cur.fastingForm) {
      FastingForm.tre => [],
      FastingForm.fiveTwo => cur.adfDaysSelected,
      FastingForm.adf => cur.fiveTwoDaysSelected,
    };

    return calculateFastingProgress(
      now: now,
      user: DummyUser(days, cur.fastingForm, cur.startTime, cur.endTime),
      activeStart: curStart,
    );
  }

  Future<void> toggleFast() async {
    final cur = ref.read(userSessionProvider).value;
    if (cur == null) return;

    final fDao = ref.read(fDaoProvider);

    final lastFast = await fDao.isFasting();
    DateTime today = DateTime.now();

    final (expectedStart, expectedEnd) = switch (cur.fastingForm) {
      FastingForm.tre => (
        DateTime(today.year, today.month, today.day, cur.startTime.hour, cur.startTime.minute),
        DateTime(today.year, today.month, today.day, cur.endTime.hour, cur.endTime.minute),
      ),
      FastingForm.fiveTwo => throw UnimplementedError(),
      FastingForm.adf => (
        DateTime(today.year, today.month, today.day, 20),
        DateTime(today.year, today.month, today.day, 10),
      ),
    };

    if (lastFast) {
      await fDao.breakFast(cur.userId, today, DateTime(today.year, today.month, today.day, cur.endTime.hour, cur.endTime.minute));
      fDao.testing();
    } else {
      await fDao.startFast(
        cur.userId,
        cur.fastingForm,
        today,
        DateTime(today.year, today.month, today.day, cur.startTime.hour, cur.startTime.minute),
      );
    }
    ref.invalidateSelf();
  }

  (DateTime, DateTime) adfTimes(int day) {
    day++;
    DateTime now = DateTime.now();

    final diff = (day - now.weekday) % 7;

    final temp = DateUtils.dateOnly(now.add(Duration(days: diff)));

      DateTime start = temp
          .subtract(const Duration(days: 1))
          .copyWith(hour: 20);
      DateTime end = temp.add(const Duration(days: 1)).copyWith(hour: 10);
      return (start, end);
  }

  Future<bool> isInEatingWindow(BuildContext context) async {
    final cur = ref.read(userSessionProvider).value;
    if (cur == null) return false;

    final fDao = ref.read(fDaoProvider);

    final lastFast = await fDao.isFasting();

    if (lastFast) {
      // if (!mounted)
      final decision = await Dialogs.dangerDialog(context, title: 'You are outside your eating window!', message: 'Are you sure you want to log a meal now? Your fast will be broken if you do');

      if (decision) {
        DateTime today = DateTime.now();
        await fDao.breakFast(cur.userId, today, DateTime(today.year, today.month, today.day, cur.endTime.hour, cur.endTime.minute));
      }
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
