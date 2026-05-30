import 'package:flutter/material.dart';
import 'package:percent_indicator_circle/percent_indicator_circle.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:testrun/models/category_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:testrun/utils/text_sizing.dart';

class CustomWidgets {
  PercentCircleIndicator circleIndicator(
    double percent,
    progress,
    Color backgroundColor,
  ) {
    return PercentCircleIndicator(
      radius: 100,
      percent: percent,
      strokeWidth: 40,
      progress: progress,
      backgroundColor: backgroundColor,
      textStyle: TextStyle(fontSize: TextSizing.large, color: Colors.white),
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
    );
  }

  LinearPercentIndicator streakIndicator(
    String text,
    double percent,
    Color backgroundColor,
    progress,
    BuildContext context,
  ) {
    return LinearPercentIndicator(
      percent: percent,
      width: MediaQuery.of(context).size.width - 80,
      lineHeight: 12,
      progressColor: progress,
      backgroundColor: backgroundColor,
      barRadius: Radius.circular(10),
    );
  }

  AppBar appBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: TextSizing.large,
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

  Container encouragementContainer(String streakInfo) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          LinearProgressIndicator(),
          Text(streakInfo, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Drawer getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Fasting Plan'),
            onTap: () {
              Navigator.pushNamed(context, '/FastingPlan');
            },
          ),
          ListTile(
            title: const Text('Track Meals'),
            onTap: () {
              Navigator.pushNamed(context, '/MealTracking');
            },
          ),
          ListTile(
            title: const Text('Step Tracking'),
            onTap: () {
              Navigator.pushNamed(context, '/StepCount');
            },
          ),
          ListTile(
            title: const Text('Setup'),
            onTap: () {
              Navigator.pushNamed(context, '/SetupUser');
            },
          ),
        ],
      ),
    );
  }

  ExpandableFab getFAB(int index) {
    CategoryModel model = CategoryModel(index: index);
    List<CategoryModel> configs = model.getFABList();
    return ExpandableFab(
      type: ExpandableFabType.up,
      pos: ExpandableFabPos.center,
      overlayStyle: ExpandableFabOverlayStyle(blur: 20),
      margin: EdgeInsets.all(10),
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: configs[3].primaryColour,
            textStyle: TextStyle(fontSize: TextSizing.small),
          ),
          child: Text(configs[3].text),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: configs[2].primaryColour,
            textStyle: TextStyle(fontSize: TextSizing.small),
          ),
          child: Text(configs[2].text),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: configs[1].primaryColour,
            textStyle: TextStyle(fontSize: TextSizing.small),
          ),
          child: Text(configs[1].text),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: configs[0].primaryColour,
            textStyle: TextStyle(fontSize: TextSizing.small),
          ),
          child: Text(configs[0].text),
        ),
      ],
    );
  }
}
