import 'package:flutter/material.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:testrun/widgets/main_app_bar.dart';

class MealTracking extends StatelessWidget {
  const MealTracking({super.key});

  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: MainAppBar.appBar('Meal Tracking'),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          groupedMeals(context),
          groupedMeals(context),
          groupedMeals(context)
        ],
      )
    );
  }


  Container groupedMeals(BuildContext context) {
    return .new(
      width: MediaQuery.sizeOf(context).width - 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.amberAccent, borderRadius: BorderRadius.circular(25)),
      child: Text('Hello')
    );
  }

  Container individualMeal() {
    return .new(
      
    );
  }
}
