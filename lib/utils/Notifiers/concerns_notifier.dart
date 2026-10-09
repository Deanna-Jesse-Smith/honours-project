import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/concerns_model.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/widgets/animations/concern_dialog.dart';

class AsyncConcerns extends AsyncNotifier<void> {
  List<HealthConcern> healthConcerns = [];
  List<PositiveReinforcement> positiveReinforcements = [];
  Set<PositiveReinforcement> weightPR = {};
  Future<void>? checkPop;

  @override
  Future<void> build() {
    healthConcerns.clear();
    positiveReinforcements.clear();
    weightPR.clear();
    final initPop = populateSets();
    checkPop = initPop;
    return initPop;
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
    healthConcerns.sort();

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
    positiveReinforcements.sort();
  }

  Future<void> ensurePopulated() => checkPop ??= populateSets();

  Future<BasicConcern?> getConcern(GoalType type) async {
    await ensurePopulated();
    final today = DateTime.now();

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
    required int days,
  }) async {
    await ensurePopulated();
    final newEval = DateTime.now().add(Duration(days: days));
    await ref.read(cDaoProvider).changeEvalDate(concern.id, newEval);

    if (concern is HealthConcern) {
      final adjusted = concern.copyWithEval(newEval);
      healthConcerns.removeWhere((h) => h.id == adjusted.id);
      healthConcerns.add(adjusted);
      healthConcerns.sort();
    } else {
      final adjusted = (concern as PositiveReinforcement).copyWithEval(newEval);
      positiveReinforcements.removeWhere((p) => p.id == adjusted.id);
      positiveReinforcements.add(adjusted);
      positiveReinforcements.sort();
    }
  }

  Future<void> doConcernDialogue(
    BasicConcern concern,
    BuildContext context,
  ) async {
    final result = await showDialog<ConcernDialogAction>(
      context: context,
      builder: (_) => ConcernDialog(concern: concern),
    );
    if (result == null) {
      return;
    }

    final days = switch (result) {
      ConcernDialogAction.dismissThreeDays => 3,
      ConcernDialogAction.dismissOneWeek => 7,
    };
    await adjustConcernEval(concern, days: days);
  }
}

final asyncConcernsProvider = AsyncNotifierProvider<AsyncConcerns, void>(
  AsyncConcerns.new,
);
