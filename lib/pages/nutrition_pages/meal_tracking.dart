import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/goals_pages/goals_page.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/meal_card.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class MealTracking extends ConsumerWidget {
  const MealTracking({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime end = DateUtils.dateOnly(DateTime.now());
    DateTime start = end.subtract(const Duration(days: 31));
    end = end.add(const Duration(days: 1));

    final goalChecker = ref.watch(checkNutritionGoalProvider);
    final streakChecker = ref.watch(checkNutritionStreakProvider);

    final mealWatcher = ref.watch(mealRangeProvider((start, end)));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meal Tracking',
          style: TextStyle(fontSize: TextSizing.large),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      drawer: MyNavigationDrawer(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MyExpandableFAB(
        index: 3,
        posi: ExpandableFabPos.right,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: goalChecker.when(
                data: (goal) {
                  if (goal.$1 == -1) {
                    return Text(
                      'No ongoing calorie goal',
                      style: TextStyle(fontSize: TextSizing.medium),
                    );
                  }

                  final model = goal.$1 == -1 ? 0.0 : goal.$1;

                  return LinearPercentIndicator(
                    alignment: MainAxisAlignment.center,
                    percent: model,
                    leading: Text(
                      '0',
                      style: TextStyle(fontSize: TextSizing.smallmed),
                    ),
                    trailing: Text(
                      '${goal.$2.toInt()}',
                      style: TextStyle(fontSize: TextSizing.smallmed),
                    ),
                    lineHeight: 15,
                    width: MediaQuery.of(context).size.width * 0.6,
                    animation: true,
                    animationDuration: 2000,
                    progressColor: Colors.amber,
                    backgroundColor: Colors.yellow,
                    barRadius: Radius.circular(10),
                  );
                },
                error: (e, l) => Text(e.toString()),
                loading: () => const Text('Loading'),
              ),
            ),
            const SizedBox(height: 10),
            streakChecker.when(
              data: (streak) {
                if (streak == null) {
                  return const SizedBox.shrink();
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                        message:
                            'Your calorie streak is the number of days in a row you have managed to reach your calorie goal.',
                        textStyle: TextStyle(fontSize: TextSizing.small),
                        constraints: BoxConstraints(maxWidth: 300),
                        triggerMode: TooltipTriggerMode.tap,
                        showDuration: Duration(seconds: 10),
                        child: SizedBox(
                          width: 50,
                          child: Icon(Icons.info_outline),
                        ),
                      ),
                      Text(
                        'You\'re on a $streak day streak!',
                        style: TextStyle(fontSize: TextSizing.medium),
                      ),
                    ],
                  );
                }
              },
              error: (e, _) => Text(e.toString()),
              loading: () => const CircularProgressIndicator(),
            ),

            const SizedBox(height: 20),

            mealWatcher.when(
              data: (meals) {
                if (meals.isEmpty) {
                  return const Text(
                    'No meals to show. You can track your meals when by clicking on the menu button below and selecting \'Log Meal\'.\n\nLog a full meal to keep track of your calorie and macronutrient intake such as protein and fibre.',
                    style: TextStyle(fontSize: TextSizing.large),
                    textAlign: TextAlign.center,
                  );
                }

                return Column(
                  spacing: 20,
                  children: meals
                      .map((meal) => DaySection(dayMeal: meal))
                      .toList(),
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (e, o) => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GoalsPage(type: GoalType.nutrition),
            ),
          ),
          child: Text(
            'Set Goals',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ),
      ],
    );
  }
}
