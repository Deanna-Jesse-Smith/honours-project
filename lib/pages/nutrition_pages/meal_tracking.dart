import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/main_app_bar.dart';
import 'package:testrun/widgets/meal_card.dart';

class MealTracking extends ConsumerWidget {
  const MealTracking({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(userSessionProvider).value;
    DateTime temp = DateTime.now();
    List<DateTime> threeDays = [
      temp,
      temp.subtract(const Duration(days: 1)),
      temp.subtract(const Duration(days: 2)),
    ];
    final threeDaysMeals = ref.watch(mealRangeProvider(threeDays));

    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: MainAppBar.appBar('Meal Tracking', session!.userName),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(ref, session, 3),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // groupedMeals(context),
          // groupedMeals(context),
          // groupedMeals(context),
          ElevatedButton(onPressed: () async {
              final newLog = await Dialogs.getCurLogMethod(context);
              if (newLog != null) ref.read(nDaoProvider).insertMeal(session.userId, DateTime.now(), newLog);
            }, child: Text('Log Weight'))
        ],
      )
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

  Container individualMeal() {
    return .new();
  }
}
