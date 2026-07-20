import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/main_app_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  // var state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(userSessionProvider).value;

    // ref.read(fDaoProvider).dummyData();

    CustomWidgets customWidgets = CustomWidgets();
    double percent = calculatePercentageTRE(session!);
    // curProgress(ref);

    return Scaffold(
      appBar: MainAppBar.appBar('', session.userName),
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
              child: circularIndicator(percent, Colors.cyan, Colors.lightBlueAccent, session)
            ),
        ],),
        ),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(ref, context, 1),
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
    UserSessionData ses
  ) {
    // String temp = ses.status.homeReminder;
    return CircularPercentIndicator(
      radius: 100,
      percent: percent,
      lineWidth: 40,
      header: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          ses.status.homeReminder,
          // "You're only an hour away from the end",
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

  double calculatePercentageTRE(UserSessionData ses) {
    final Duration diff = ses.endTime.difference(ses.startTime);
    int diffMinutes = diff.inMinutes;
    debugPrint('Calculate: $diffMinutes from ${ses.endTime} and ${ses.userId}');
    return diffMinutes / 1440;
  }

  // double calculateProgressCircle() {

  //   switch (userState.fastingForm.value) {
  //     case FastingForm.tre:
  //     break;
  //     case FastingForm.adf:
  //     break;
  //     case FastingForm.fiveTwo:
  //     break;
  //   }
  // }

  // Future<void> curProgress(WiedgetRef ref) async {
  //   final cur = await getIt<FastingDao>().isFasting(userState.userID);

  //   // final cur = ref.
  //   if (cur == null) {
  //     // await getIt<FastingDao>().startFast(userState.userID, FastingForm.tre, DateTime.now());
  //     return;
  //   }

  //   final userSnapshot = User(
  //   userID: userState.userID,
  //   name: userState.userName.value,
  //   typicalEatingStart: userState.startTime.value,
  //   typicalEatingEnd: userState.endTime.value,
  //   isMetric: true,
  //   experience: 'Beginner',
  //   createdDate: DateTime.now(),
  //   adfDaysSelected: '',
  //   fiveTwoDaysSelected: '',
  //   formIF: FastingFormConverter().toSql(userState.fastingForm.value)
  // );
  //   FastingStatus test = determineFastingStatus(now: DateTime.now(), calculator: TRECalculator(), user: userSnapshot, activeLog: cur);
  //   userState.status.value = test;
  //   // getIt.registerSingleton<FastingStatus>(test);
  //   print('Status: $test');
  // }
}
