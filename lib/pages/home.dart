import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:percent_indicator_circle/percent_indicator_circle.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:testrun/utils/text_sizing.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: customWidgets.appBar('Welcome back'),
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
              child: customWidgets.circularIndicator(0.4, Colors.cyan, Colors.lightBlueAccent)
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

  PercentCircleIndicator circleIndicator(
    double percent,
    Color progress,
    Color backgroundColor,
  ) {
    return PercentCircleIndicator(
      percent: percent,
      strokeWidth: 20,
      // animated: true,
      // duration: Duration(seconds: 1),
      progress: progress,
      backgroundColor: backgroundColor,
      textStyle: TextStyle(fontSize: 24, color: Colors.white),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Welcome back',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      // leading: GestureDetector(
      //   onTap: () {},
      //   child: Container(
      //     margin: EdgeInsets.all(5),
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //       color: Colors.blueAccent,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: Icon(Icons.menu),
      //     // child: SvgPicture.asset('assets/icons/hamburger-menu.svg'),
      //     // child: SvgPicture.asset('assets/icons/LefArrow.svg'),
      //   ),
      // ),
    );
  }
}
