import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/main_app_bar.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class HydrationTracking extends StatelessWidget {
  const HydrationTracking({super.key});

  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: MainAppBar.appBar('Hydration Tracking'),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Hydration Motivation',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: LinearPercentIndicator(
                percent: 0.7,
                lineHeight: 10,
                width: MediaQuery.of(context).size.width - 80,
                animation: true,
                animationDuration: 2000,
                progressColor: Colors.amber,
                backgroundColor: Colors.black,
              ),
            ),
            LiquidCircularProgressIndicator(
  value: 0.25, // Defaults to 0.5.
  valueColor: AlwaysStoppedAnimation(Colors.pink), // Defaults to the current Theme's accentColor.
  backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
  borderColor: Colors.red,
  borderWidth: 5.0,
  direction: Axis.horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
  center: Text("Loading..."),
),
          ],
        ),
      ),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(4),
    );
  }
}
