import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/main_app_bar.dart';
import 'package:testrun/widgets/meal_card.dart';

class MealTracking extends ConsumerWidget {
  const MealTracking({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(userSessionProvider).value;
    DateTime temp = DateTime.now();
    List<DateTime> threeDays = [
      DateUtils.dateOnly(temp),
      DateUtils.dateOnly(temp.subtract(const Duration(days: 1))),
      DateUtils.dateOnly(temp.subtract(const Duration(days: 2))),
    ];
    // final threeDaysMeals = ref.watch(mealRangeProvider(threeDays)).value;
    // final viewMeals = ref.watch(nDaoProvider).getMealsInRange(threeDays);
    final viewFoods = ref.watch(nDaoProvider).getFoodInRange(threeDays);


    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: MainAppBar.appBar('Meal Tracking', session!.userName),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MyExpandableFAB(index: 3),
      // floatingActionButton: customWidgets.getFAB(ref, context, 3),
      body: FutureBuilder(future: viewFoods, builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('No meals to show', style: TextStyle(fontSize: TextSizing.large),);
        }
        final dayFoods = snapshot.data;

        return ListView.builder(itemCount: dayFoods!.length, itemBuilder: (context, index) {
          if (dayFoods.isNotEmpty) {
            return DaySection(dayMeal: dayFoods[threeDays[index]]!);
          }
          return SizedBox(height: 10,);
        });
      }),

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
