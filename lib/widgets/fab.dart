import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/category_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/pages/nutrition_pages/meal_log.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';

class MyExpandableFAB extends ConsumerWidget {
  final int index;
  final ExpandableFabPos posi;
  late UserSessionData session;
  MyExpandableFAB({
    super.key,
    required this.index,
    this.posi = ExpandableFabPos.center,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    session = ref.watch(userSessionProvider).value!;
    final actions = BuildFAB.buildFab(
      ref,
      index: index,
      onHydrationTapped: () async {
        final newAmount = await Dialogs.getSpinnerWaterInput(
          context,
          title: 'How many cups have you drank?',
        );
        if (newAmount != null) {
          ref
              .read(hDaoProvider)
              .addHydration(session.userId, DateTime.now(), newAmount);
        }
      },
      onMealTapped: () async {
        final newLog = await Dialogs.getCurLogMethod(context, ref, session);
        debugPrint('Log testing');

        if (newLog != null) {
          debugPrint('Log: ${newLog.name}');
          if (newLog == LogMethod.quick) {
            ref
                .read(nDaoProvider)
                .insertFoodLog(MealCategory.quick, null, null, newLog);
          } else if (newLog == LogMethod.full) {
            if (!context.mounted) return;
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const MealLog()));
          } else {
            if (!context.mounted) return;
            chooseRepeatMeal(context, ref);
          }
        } else {
          debugPrint('Log: null');
        }
      },
      onWeightTapped: () async {
        double? curWeight = await ref
            .read(wDaoProvider)
            .latestWeight(session.userId);
        if (!context.mounted) return;
        final newAmount = await Dialogs.getNewInput(
          context,
          initialVal: curWeight,
          title: 'Log Weight',
        );
        if (newAmount != null) {
          ref
              .read(wDaoProvider)
              .insertWeight(
                session.userId,
                newAmount.toDouble(),
                DateTime.now(),
              );
        }
      },
    );
    return ExpandableFab(
      type: ExpandableFabType.up,
      pos: posi,
      overlayStyle: ExpandableFabOverlayStyle(blur: 20),
      margin: const EdgeInsets.all(10),
      children: actions.reversed
          .map(
            (button) => ElevatedButton(
              onPressed: button.onPressed,
              child: Text(button.title),
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

  // void handleDialog() async {
  //   double? curWeight = await reff
  //           .read(wDaoProvider)
  //           .latestWeight(session!.userId);
  //       final newAmount = await Dialogs.getNewInput(
  //         context,
  //         initialVal: curWeight,
  //         title: 'Log Weight',
  //       );
  //       if (newAmount != null) {
  //         reff
  //             .read(wDaoProvider)
  //             .insertWeight(
  //               session.userId,
  //               newAmount.toDouble(),
  //               DateTime.now(),
  //             );
  //       }
  // }
}
