import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/pages/goals_pages/goals_page.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/main_app_bar.dart';
import 'package:testrun/widgets/meal_card.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class MealTracking extends ConsumerWidget {
  const MealTracking({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(userSessionProvider).value;
    DateTime end = DateUtils.dateOnly(DateTime.now());
    DateTime start = end.subtract(const Duration(days: 31));
    end = end.add(const Duration(days: 1));

    final goalChecker = ref.watch(checkNutritionGoalProvider);
    final streakChecker = ref.watch(checkNutritionStreakProvider);

    return Scaffold(
      appBar: MainAppBar.appBar('Meal Tracking', session!.userName),
      drawer: MyNavigationDrawer(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MyExpandableFAB(index: 3),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: goalChecker.when(data: (goal) {
                final model = goal == -1 ? 0.0 : goal;

                  if (model == -1) {
                    return Text('No ongoing goal');
                  }

                  return LinearPercentIndicator(
                    percent: model,
                    lineHeight: 15,
                    width: MediaQuery.of(context).size.width - 80,
                    animation: true,
                    animationDuration: 2000,
                    progressColor: Colors.amber,
                    backgroundColor: Colors.black,
                  );
              }, error: (e, l) => Text(e.toString()), loading: () => Text('Loading'))
            ),
          streakChecker.when(data: (streak) {
              if (streak == null) {
                return const SizedBox.shrink();
              } else {
                return Text('You\'re on a $streak day streak!', style: TextStyle(fontSize: TextSizing.medium),);
              }
            }, error: (e, _) => Text(e.toString()), loading: () => const CircularProgressIndicator()),
          StreamBuilder(
            stream: ref.read(nDaoProvider).findFoodInRange(DateTimeRange(start: start, end: end)),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                debugPrint('FoodMap: no data');
                return const Text(
                  'No meals to show',
                  style: TextStyle(fontSize: TextSizing.large),
                );
              }
          
              final dayFoods = snapshot.data;
              if (dayFoods == null) {
                debugPrint('FoodMap: null');
                return const Text(
                  'No meals to show',
                  style: TextStyle(fontSize: TextSizing.large),
                );
              }
          
              Map<DateTime, DayFoods> foodMap = {};
              for (final foodItem in dayFoods) {
                DayFoods temp = DayFoods.range(foodItem, foodItem.logDate);
                foodMap.update(DateUtils.dateOnly(foodItem.logDate), (u) {
                  u.foods.add(foodItem);
                  return u;
                }, ifAbsent: () => temp);
              }
              List<DayFoods> curr = foodMap.values.toList();
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: curr.length,
                  itemBuilder: (context, index) {
                    if (curr.isNotEmpty) {
                      return DaySection(dayMeal: curr[index]);
                    }
                    return SizedBox(height: 10);
                  },
                ),
              );
            },
          ),
        ],
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
                'Goals/Streaks',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
            ),
      ],

      // body: FutureBuilder(future: viewMeals, builder: (context, snapshot) {
      //   if (!snapshot.hasData) {
      //     return const Text('No meals to show', style: TextStyle(fontSize: TextSizing.large),);
      //   }

      //   final daysMeals = snapshot.data;

      //   return ListView.builder(itemCount: daysMeals!.length, itemBuilder: (context, index) {
      //     if (daysMeals.isNotEmpty) {
      //       return DaySection(dayMeal: daysMeals[threeDays[index]]!);
      //     }
      //     return SizedBox(height: 10,);
      //   },);
      // }),
      // body: ListView.builder(
      //   itemBuilder: (context, index) {
      //     return Column(
      //       children: [
      //       Text('Today\'s Meals'),

      //       ]);
      //   },
      // ),

      //  body: threeDaysMeals.when(
      //   data: (meals) =>
      //       ListView(children: meals.map((m) => MealCard(meal: m)).toList()),
      //   error: (e, st) => Text('Error: $e'),
      //   loading: () => const CircularProgressIndicator(),
      // ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     // groupedMeals(context),
      //     // groupedMeals(context),
      //     // groupedMeals(context),
      //     ElevatedButton(onPressed: () async {
      //         final newLog = await Dialogs.getCurLogMethod(context, ref, session);
      //         if (newLog != null) ref.read(nDaoProvider).insertMeal(session.userId, DateTime.now(), newLog);
      //       }, child: Text('Log Weight'))
      //   ],
      // )
    );
  }

  Container groupedMeals(BuildContext context) {
    return .new(
      width: MediaQuery.sizeOf(context).width - 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text('Hello'),
    );
  }
}
