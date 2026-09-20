import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/pages/nutrition_pages/meal_log.dart';
import 'package:testrun/utils/Notifiers/fasting_notifier.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/animations/celebration_title.dart';
import 'package:testrun/widgets/dialogs.dart';

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
    final isFasting = ref.watch(isFastingProvider);
    
    // final actions = BuildFAB.buildFab(
    //   ref,
    //   index: index,
    //   onHydrationTapped: () async {
    //     final newAmount = await Dialogs.getSpinnerWaterInput(
    //       context,
    //       title: 'How much water have you drank?',
    //     );
    //     if (newAmount != null) {
    //       await ref.read(asyncGoalsProvider.notifier).addHydration(newAmount).whenComplete(() => ref.invalidate(checkHydrationGoalProvider));
    //     }
    //   },
    //   onMealTapped: () async {
    //     final newLog = await Dialogs.getCurLogMethod(context, ref, session);

    //     if (newLog != null) {
    //       debugPrint('Log: ${newLog.name}');
    //       if (newLog == LogMethod.quick) {
    //         await ref
    //             .read(nDaoProvider)
    //             .insertFoodLog(MealCategory.quick, null, null, newLog);
    //       } else if (newLog == LogMethod.full) {
    //         if (!context.mounted) return;
    //         Navigator.of(
    //           context,
    //         ).push(MaterialPageRoute(builder: (context) => const MealLog()));
    //       } else {
    //         if (!context.mounted) return;
    //         chooseRepeatMeal(context, ref);
    //       }
    //     } else {
    //       debugPrint('Log: null');
    //     }
    //   },
    //   onWeightTapped: () async {
    //     double? curWeight = await ref
    //         .read(wDaoProvider)
    //         .latestWeight(session.userId);
    //     if (!context.mounted) return;
    //     final newAmount = await Dialogs.getNewInput(
    //       context,
    //       initialVal: curWeight,
    //       title: 'Log Weight',
    //     );
    //     if (newAmount != null) {
    //       await ref
    //           .read(wDaoProvider)
    //           .insertWeight(
    //             session.userId,
    //             newAmount.toDouble(),
    //             DateTime.now(),
    //           ).whenComplete(() => ref.invalidate(checkWeightGoalProvider));
    //     }
    //   },
    // );
    final actions = [
      if (session.fastingForm != FastingForm.fiveTwo)
        FabButton(
          title: isFasting.when(
            data: (isFast) => isFast ? 'Break my fast' : 'Start my fast',
            error: (_, _) => 'Error',
            loading: () => 'Loading',
          ),
          colour: Colors.deepPurpleAccent,
          onPressed: () {
            try {
              ref.read(asyncFatingNotifier.notifier).toggleFast();
            } finally {
              ref.invalidate(checkFastingGoalProvider);
              ref.invalidate(checkFastingStatusProvider);
              ref.invalidate(checkFastingProgressProvider);
            }
            // ref
            //   .read(asyncFatingNotifier.notifier)
            //   .toggleFast()
            //   .whenComplete(() => ref.invalidate(checkFastingGoalProvider));
          },
        ),
      FabButton(
        title: 'Log Weight',
        colour: Colors.green,
        onPressed: () async {
          double? curWeight = await ref
              .read(wDaoProvider)
              .getLatestWeight(session.userId);
          if (!context.mounted) return;
          final newAmount = await Dialogs.getNewInput(
            context,
            initialVal: curWeight,
            title: 'Log Weight',
            unit: 'kg'
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

            // await ref
            //     .read(wDaoProvider)
            //     .insertWeight(
            //       session.userId,
            //       newAmount.toDouble(),
            //       DateTime.now(),
            //     )
            //     .whenComplete(() => ref.invalidate(checkWeightGoalProvider));
          }
        },
      ),
      FabButton(
        title: 'Log Meal',
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
                    .logMeal(
                      MealCategory.quick,
                      {},
                      newLog,
                      DateTime.now(),
                    )
                    .whenComplete(
                      () => ref.invalidate(checkNutritionGoalProvider),
                    );
                    // await ref
                    // .read(asyncGoalsProvider.notifier)
                    // .logMeal(
                    //   MealCategory.quick,
                    //   null,
                    //   null,
                    //   newLog,
                    //   DateTime.now(),
                    // )
                    // .whenComplete(
                    //   () => ref.invalidate(checkNutritionGoalProvider),
                    // );
                    await ref.read(asyncFatingNotifier.notifier).toggleFast();
                  }
                }
              } else {
                try {
                  celebrate = await ref
                    .read(asyncGoalsProvider.notifier)
                    .logMeal(
                      MealCategory.quick,
                      {},
                      newLog,
                      DateTime.now(),
                    );
                } finally {
                  ref.invalidate(checkNutritionGoalProvider);
                }
                // celebrate = await ref
                //     .read(asyncGoalsProvider.notifier)
                //     .logMeal(
                //       MealCategory.quick,
                //       {},
                //       newLog,
                //       DateTime.now(),
                //     )
                //     .whenComplete(
                //       () => ref.invalidate(checkNutritionGoalProvider),
                //     );
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
        title: 'Log Hydration',
        colour: Colors.blue,
        onPressed: () async {
          final newAmount = await Dialogs.getSpinnerWaterInput(
            context,
            title: 'How much water have you drank since your last log?',
          );
          if (newAmount != null) {
            final check = await ref
                .read(asyncGoalsProvider.notifier)
                .addHydration(newAmount)
                .whenComplete(() => ref.invalidate(checkHydrationGoalProvider));

            if (check) {
              if (!context.mounted) return;
              showDialog(
                context: context,
                builder: (_) => DialogTitle(type: GoalType.hydration),
              );
            }
          }
        },
      ),
    ];

    return ExpandableFab(
      type: ExpandableFabType.up,
      pos: posi,
      overlayStyle: ExpandableFabOverlayStyle(blur: 20),
      childrenAnimation: ExpandableFabAnimation.none,
      margin: const EdgeInsets.all(10),
      children:
          [...actions.sublist(index - 1), ...actions.sublist(0, index - 1)]
              .reversed
              .map(
                (button) => ElevatedButton(
                  onPressed: button.onPressed,
                  child: Text(button.title, 
                      style: TextStyle(fontSize: TextSizing.medium),),
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
  final String title;
  final Color colour;
  final VoidCallback onPressed;

  const FabButton({
    required this.title,
    required this.colour,
    required this.onPressed,
  });
}
