import 'package:flutter/material.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class MealTracking extends StatelessWidget {
  const MealTracking({super.key});

  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: customWidgets.appBar('Track my Meals'),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(3),
    );
  }
}
