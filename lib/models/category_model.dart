import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/Notifiers/fasting_notifier.dart';

class FabButton {
  final String title;
  final Color colour;
  final VoidCallback onPressed;

  const FabButton ({
    required this.title,
    required this.colour,
    required this.onPressed,
  });
}

class BuildFAB {
  static List<FabButton> buildFab(WidgetRef ref, {required int index, required VoidCallback onWeightTapped, required VoidCallback onMealTapped, required VoidCallback onHydrationTapped}) {
    final isFasting = ref.watch(isFastingProvider);
    final actions = [
    FabButton(title: isFasting.when(data: (isFast) => isFast ? 'Break my fast' : 'Start my fast', error: (_, _) => 'Error', loading: () => 'Loading'), colour: Colors.deepPurpleAccent, onPressed: () => ref.read(asyncFatingNotifier.notifier).toggleFast().whenComplete(() => ref.invalidate(checkFastingGoalProvider))),
    FabButton(title: 'Log Weight', colour: Colors.green, onPressed: onWeightTapped),
    FabButton(title: 'Log Meal', colour: Colors.amber, onPressed: onMealTapped),
    FabButton(title: 'Log Hydration', colour: Colors.blue, onPressed: onHydrationTapped)
  ];
    return [
      ...actions.sublist(index - 1),
      ...actions.sublist(0, index - 1),
    ];
  }
}