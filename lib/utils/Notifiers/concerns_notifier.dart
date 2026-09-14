import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/concerns_model.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/widgets/animations/concern_dialog.dart';

class AsyncConcerns extends AsyncNotifier<BasicConcern> {
  Set<HealthConcern> healthConcerns = {};
  Set<PositiveReinforcement> positiveReinforcements = {};
  Set<PositiveReinforcement> weightPR = {};

  @override
  FutureOr<BasicConcern> build() async {
    // await ref.read(cDaoProvider).dummyData();
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
      if (pr.type != null && pr.type == GoalType.weight) {
      weightPR.add(
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
      } else {
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
  }

  Future<BasicConcern?> getConcern(GoalType type) async {
    final today = DateTime.now();
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

    final healthRelated = healthConcerns.where(
      (h) => h.gType == type || h.gType == null,
    );
    for (final health in healthRelated) {
      if (health.nextEval == null || today.compareTo(health.nextEval!) > -1) {
        bool isValid = health.gType == null
            ? true
            : await ref
                  .read(asyncGoalsProvider.notifier)
                  .isValidConcern(type, health.threshold, health.window);

        if (isValid) {
          return health;
        }
      }
    }

    final prRelated = positiveReinforcements.where(
      (pr) => pr.gType == type || pr.gType == null,
    );
    for (final pr in prRelated) {
      if (pr.nextEval == null || today.compareTo(pr.nextEval!) > -1) {
        bool isValid = pr.gType == null
            ? true
            : await ref
                  .read(asyncGoalsProvider.notifier)
                  .isValidPR(type, pr.threshold, pr.window);
        if (isValid) {
          return pr;
        }
      }
    }
    return null;
  }

  Future<void> adjustConcernEval(
    BasicConcern concern, {
    bool week = false,
  }) async {
    int numDays = week ? 7 : 2;
    DateTime newEval = DateUtils.dateOnly(
      DateTime.now().add(Duration(days: numDays)),
    );
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

  Future<void> doConcernDialogue(BasicConcern concern, BuildContext context) async {
    final result = await showDialog<int>(context: context, builder: (_) => ConcernDialog(concern: concern));
    debugPrint('Eval resutl: $result');
    if (result == null || result > 1) {
      adjustConcernEval(concern);
    } else {
      adjustConcernEval(concern, week: true);
    }
  }
}

final asyncConcernsProvider =
    AsyncNotifierProvider<AsyncConcerns, BasicConcern>(AsyncConcerns.new);
