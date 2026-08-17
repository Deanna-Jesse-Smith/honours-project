import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
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
    final goalsNotifier = ref.watch(asyncGoalsProvider.notifier);
    DateTime end = DateUtils.dateOnly(DateTime.now());
    DateTime start = end.subtract(const Duration(days: 3));
    end = end.add(const Duration(days: 1));

    // if (start.day - 3 < 0) {
    //   int tempMonth = start.month - 1;
    //   int tempYear = start.year;
    //   if (tempMonth < 0) {
    //     tempYear -= 1;
    //     end = DateTime(tempYear, 11, 0);
    //   } else {
    //     end = DateTime(start.year, tempMonth, 0);
    //   }

    //   int day = (end.day + start.day) - 3;
    //   end = DateTime(tempYear, tempMonth, day);
    // } else {
    //   end = DateTime(start.year, start.month, start.day - 3);
    // }

    return Scaffold(
      appBar: MainAppBar.appBar('Meal Tracking', session!.userName),
      drawer: MyNavigationDrawer(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MyExpandableFAB(index: 3),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: FutureBuilder(
                future: goalsNotifier.checkGoal(GoalType.nutrition),
                builder: (context, asyncSnapshot) {
                  if (!asyncSnapshot.hasData) {
                    return Text('No ongoing goal');
                  }

                  final model = asyncSnapshot.data;

                  if (model == null || model == -1) {
                    return Text('No ongoing goal');
                  }

                  return LinearPercentIndicator(
                    percent: model,
                    lineHeight: 10,
                    width: MediaQuery.of(context).size.width - 80,
                    animation: true,
                    animationDuration: 2000,
                    progressColor: Colors.amber,
                    backgroundColor: Colors.black,
                  );
                }
              ),
            ),
          StreamBuilder(
                stream: ref.watch(gDaoProvider).getActiveFoodStreak(),
                builder: (context, asyncSnapshot) {
                  if (!asyncSnapshot.hasData) {
                    return const Text('No ongoing Fasting streak');
                  }

                  final days = asyncSnapshot.data;

                  if (days == null) {
                    return const SizedBox.shrink();
                  }
                  //! Calculate the progress here somehow

                  return Text('You\'re on a $days streak!');
                }
              ),
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
