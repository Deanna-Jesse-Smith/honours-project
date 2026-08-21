import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/concerns_model.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/user_state.dart';

class AsyncConcerns extends AsyncNotifier<BasicConcern> {
  Set<HealthConcern> healthConcerns = {};
  Set<PositiveReinforcement> positiveReinforcements = {};

  @override
  FutureOr<BasicConcern> build() {
    populateSets();
    return healthConcerns.first;
  }

  Future<void> populateSets() async {
    final healths = await ref.read(cDaoProvider).getHealthConcerns();
    for (final health in healths) {
      healthConcerns.add(
        HealthConcern(
          health.id,
          health.type,
          health.title,
          health.displayContext,
          health.threshold,
          health.window,
          health.citation,
          health.nextEval,
        ),
      );
    }

    final prs = await ref.read(cDaoProvider).getPRConcerns();
    for (final pr in prs) {
      positiveReinforcements.add(
        PositiveReinforcement(
          pr.id,
          pr.type,
          pr.title,
          pr.displayContext,
          pr.threshold,
          pr.window,
          pr.citation,
          pr.nextEval,
        ),
      );
    }
  }

  Future<BasicConcern?> getConcern(GoalType type) async {
    // final session = ref.watch(userSessionProvider).value;
    if (type == GoalType.weight) {
      // final weight = await ref.read(wDaoProvider).latestWeight(session!.userId);
      // final height = session!.height;

      // final bmi = weight! / (height * height);

      // if (bmi > 25) {
      //   // return HealthConcern(-1, type, 'Unhealthy BMI Results', 'According to ', -1, -1, '', DateTime.now());
      // } else if (bmi < 18.5) {
      //   return HealthConcern(-1, type, 'Unhealthy BMI Results', text, -1, -1, '', DateTime.now());
      // } else {

      // }
      
    
    }
    final healthRelated = healthConcerns.where((h) => h.gType == type);
    final today = DateTime.now();
    for (final health in healthRelated) {
      if (health.nextEval == null || health.nextEval!.compareTo(today) > -1) {
        final isValid = await ref
            .read(asyncGoalsProvider.notifier)
            .isValidConcern(type, health.threshold, health.window);
        if (isValid) {
          return health;
        }
      }
    }

    final prRelated = positiveReinforcements.where((pr) => pr.gType == type);
    for (final pr in prRelated) {
      if (pr.nextEval == null || pr.nextEval!.compareTo(today) > -1) {
        final isValid = await ref
            .read(asyncGoalsProvider.notifier)
            .isValidConcern(type, pr.threshold, pr.window);
        if (isValid) {
          return pr;
        }
      }
    }
    return null;
  }

  Future<void> adjustConcernEval(BasicConcern concern) async {
    DateTime newEval = DateUtils.dateOnly(DateTime.now().add(const Duration(days: 7)));
    await ref.read(cDaoProvider).changeEvalDate(concern.id, newEval);
    
    if (concern is HealthConcern) {
      final adjusted = concern.copyWithEval(newEval);
      healthConcerns.removeWhere((h) => h.id == adjusted.id);
      healthConcerns.add(adjusted);
    } else {
      final adjusted = (concern as PositiveReinforcement).copyWithEval(newEval);
      positiveReinforcements.removeWhere((p) => p.id == adjusted.id);
      positiveReinforcements.add(adjusted);
    }
  }
}

final asyncConcernsProvider =
    AsyncNotifierProvider<AsyncConcerns, BasicConcern>(AsyncConcerns.new);
