import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/pages/nutrition_pages/meal_log.dart';
import 'package:testrun/utils/notifiers/fasting_notifier.dart';
import 'package:testrun/utils/notifiers/goal_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/animations/celebration_title.dart';
import 'package:testrun/widgets/dialogs.dart';


 /// A floating action button (FAB) widget that provides an expandable menu with various actions related to fasting, weight logging, meal logging, and hydration tracking. The FAB displays different actions based on the user's fasting form and allows users to perform tasks such as starting or breaking a fast, logging weight, logging meals, and logging hydration. The widget also handles user interactions and updates the corresponding state using Riverpod providers.
class MyExpandableFAB extends ConsumerWidget {
  final int index;
  final ExpandableFabPos posi;
  const MyExpandableFAB({
    super.key,
    required this.index,
    this.posi = ExpandableFabPos.center,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserSessionData session = ref.watch(userSessionProvider).value!;
    final actions = [
      if (session.fastingForm != FastingForm.fiveTwo)
        FabButton(
          title: Consumer(
            builder: (context, ref, _) {
              final isFasting = ref.watch(isFastingProvider);
              return Text(
                isFasting.when(
                  data: (isFast) => !isFast ? 'Start my fast' : 'Break my fast',
                  error: (_, _) => 'Error',
                  loading: () => 'Loading',
                ),
                style: TextStyle(fontSize: TextSizing.medium),
              );
            },
          ),
          colour: Colors.deepPurpleAccent,
          onPressed: () async {
            try {
              await ref.read(asyncFatingNotifier.notifier).toggleFast();
            } finally {
              ref.invalidate(checkFastingGoalProvider);
              ref.invalidate(checkFastingStatusProvider);
              ref.invalidate(checkFastingProgressProvider);
            }
          },
        ),
      FabButton(
        title: Text(
          'Log Weight',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
        colour: Colors.green,
        onPressed: () async {
          double? curWeight = await ref
              .read(wDaoProvider)
              .getLatestWeight(session.userId);
          if (!context.mounted) return;
          final newAmount = await Dialogs.getWeightInput(
            context,
            initialVal: curWeight,
            title: 'Log Weight',
            unit: 'kg',
          );
          if (newAmount != null) {
            final check = await ref
                .read(asyncGoalsProvider.notifier)
                .logWeight(newAmount)
                .whenComplete(() => ref.invalidate(checkWeightGoalProvider));

            if (check.$2 == 1) {
              if (!context.mounted) return;
              showDialog(
                context: context,
                builder: (_) => DialogTitle(type: GoalType.weight),
              );
            }
          }
        },
      ),
      FabButton(
        title: Text('Log Meal', style: TextStyle(fontSize: TextSizing.medium)),
        colour: Colors.amber,
        onPressed: () async {
          final newLog = await Dialogs.getCurLogMethod(context, ref, session);

          if (newLog != null) {
            if (newLog == LogMethod.quick) {
              if (!context.mounted) return;
              bool celebrate = false;
              final decision = await ref
                  .read(asyncFatingNotifier.notifier)
                  .isInEatingWindow(context);
              if (decision) {
                if (context.mounted) {
                  final decision2 = await Dialogs.dangerDialog(
                    context,
                    title: 'You are outside your eating window!',
                    message:
                        'Are you sure you want to log a meal now? Your fast will be broken if you do',
                  );

                  if (decision2) {
                    celebrate = await ref
                        .read(asyncGoalsProvider.notifier)
                        .logMeal(MealCategory.quick, {}, newLog, DateTime.now())
                        .whenComplete(
                          () => ref.invalidate(checkNutritionGoalProvider),
                        );
                    await ref.read(asyncFatingNotifier.notifier).toggleFast();
                  }
                }
              } else {
                try {
                  celebrate = await ref
                      .read(asyncGoalsProvider.notifier)
                      .logMeal(MealCategory.quick, {}, newLog, DateTime.now());
                } finally {
                  ref.invalidate(checkNutritionGoalProvider);
                }
              }

              if (celebrate) {
                if (!context.mounted) return;
                showDialog(
                  context: context,
                  builder: (_) => DialogTitle(type: GoalType.nutrition),
                );
              }
            } else if (newLog == LogMethod.full) {
              if (!context.mounted) return;
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const MealLog()));
            }
            // else {
            //   if (!context.mounted) return;
            //   chooseRepeatMeal(context, ref);
            // }
          } else {
            debugPrint('Log: null');
          }
        },
      ),
      FabButton(
        title: Text(
          'Log Hydration',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
        colour: Colors.blue,
        onPressed: () async {
          final newAmount = await Dialogs.getSpinnerWaterInput(
            context,
            title: 'How much water have you drank since your last log?',
          );
          if (newAmount != null) {
            try {
              final check = await ref
                  .read(asyncGoalsProvider.notifier)
                  .addHydration(newAmount);

              if (check) {
                if (!context.mounted) return;
                showDialog(
                  context: context,
                  builder: (_) => DialogTitle(type: GoalType.hydration),
                );
              }
            } finally {
              ref.invalidate(checkHydrationGoalProvider);
              ref.invalidate(checkHydrationStreakProvider);
            }
          }
        },
      ),
    ];

    final topActionIndex =
        session.fastingForm == FastingForm.fiveTwo && index > 1
        ? index - 1
        : index;
    final orderedActions = [...actions];
    final topAction = orderedActions.removeAt(topActionIndex - 1);

    if (session.fastingForm != FastingForm.fiveTwo && topActionIndex != 1) {
      final fastingAction = orderedActions.removeAt(0);
      orderedActions.add(fastingAction);
    }
    orderedActions.add(topAction);

    return ExpandableFab(
      type: ExpandableFabType.up,
      pos: posi,
      overlayStyle: ExpandableFabOverlayStyle(blur: 20),
      margin: const EdgeInsets.all(10),
      children: orderedActions
          .map(
            (button) => ElevatedButton(
              onPressed: button.onPressed,
              child: button.title,
            ),
          )
          .toList(),
    );
  }

  Future<void> chooseRepeatMeal(BuildContext context, WidgetRef ref) async {
    DayFoods? yesterdayMeals = await ref.read(nDaoProvider).getYesterdayMeals();
    if (!context.mounted) return;
    if (yesterdayMeals == null) {
      await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: Text('You do not have any meals from yesterday to repeat'),
        ),
      );
    } else {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Center(
            child: Text('Which of yesterday\'s meal would you like to repeat?'),
          ),
          actions: yesterdayMeals.foods
              .map(
                (c) => TextButton(
                  onPressed: () => ref.read(nDaoProvider).repeatFood(c),
                  child: Text(c.category.cardName),
                ),
              )
              .toList(),
        ),
      );
    }
  }
}

class FabButton {
  final Widget title;
  final Color colour;
  final VoidCallback onPressed;

  const FabButton({
    required this.title,
    required this.colour,
    required this.onPressed,
  });
}
