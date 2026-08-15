import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/FastingPlan.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/user_state.dart';

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
    List<bool> daysADF, List<bool> days52,
  ) async {
    final session = ref.watch(userSessionProvider).value;

    DateTime today = DateTime.now();
    switch (newForm) {
      case FastingForm.tre:
        ref
            .read(uDaoProvider)
            .changeToTRE(
              session!.userId,
              start.convertToDateTime(today),
              end.convertToDateTime(today),
            );
      case FastingForm.fiveTwo:
        ref.read(uDaoProvider).changeTo52(session!.userId, boolsToInts(days52));
      case FastingForm.adf:
        ref.read(uDaoProvider).changeToADF(session!.userId, boolsToInts(daysADF));
    }

    AsyncGoals tempGoals = ref.read(asyncGoalsProvider.notifier);
    BasicGoal? tempGoal = await ref.read(gDaoProvider).findActiveFastingGoal();
    if (tempGoal != null) tempGoals.finishGoal(tempGoal.goalID);

    if (session.isFasting) {
      ref.read(userSessionProvider.notifier).toggleFast();
    }
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

final asyncFatingNotifier = AsyncNotifierProvider<AsyncFasting, FastingForm>(AsyncFasting.new);