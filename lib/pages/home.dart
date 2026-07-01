import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator_circle/percent_indicator_circle.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/main_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = CustomWidgets();
    calculatePercentageTRE();
    return Scaffold(
      appBar: MainAppBar.appBar(''),
      // appBar: customWidgets.appBar(customWidgets.insertRow().then((value) => ,),
      // body: circleIndicator(0.4, Colors.blueAccent, Colors.lightBlueAccent),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: const Text('Encouragement Text', 
              style: TextStyle(fontSize: TextSizing.large),)
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: const Text('Streak progress text', 
              style: TextStyle(fontSize: TextSizing.medium),)
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: customWidgets.streakIndicator('Streak underway', 0.6, Colors.orange, Colors.amberAccent, context)
            ),
            Padding(
              padding: EdgeInsets.all(35),
              child: circularIndicator(calculatePercentageTRE(), Colors.cyan, Colors.lightBlueAccent)
            ),
        ],),
        ),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(1),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.purpleAccent,
      //   onPressed: () {

      //   }),
    );
  }

    CircularPercentIndicator circularIndicator(
    double percent,
    Color backgroundColor,
    progress,
  ) {
    return CircularPercentIndicator(
      radius: 100,
      percent: percent,
      lineWidth: 40,
      header: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: const Text(
          "You're only an hour away from the end",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: TextSizing.small),
        ),
      ),
      progressColor: progress,
      backgroundColor: backgroundColor,
      circularStrokeCap: CircularStrokeCap.round,
      animationDuration: 500,
    );
  }

  double calculatePercentageTRE() {
    final Duration diff = userState.endTime.value.difference(userState.startTime.value);
    int diffMinutes = diff.inMinutes;
    print('minues: ' + diffMinutes.toString());
    return 700 / 1440;
  }
}
