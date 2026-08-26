import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/Notifiers/fasting_notifier.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/main_app_bar.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(userSessionProvider);
    final checkGoal = ref.watch(checkFastingGoalProvider);
    final checkStatus = ref.watch(checkFastingStatusProvider);
    final checkProgress = ref.watch(checkFastingProgressProvider);
    // ref.read(fDaoProvider).dummyData();

    // curProgress(ref);

    return Scaffold(
      appBar: MainAppBar.appBar('', session.value!.userName),
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
              child: const Text(
                'Encouragement Text',
                style: TextStyle(fontSize: TextSizing.large),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: checkGoal.when(data: (goal) {
                final model = goal > -1 ? goal : 0.0;
    return LinearPercentIndicator(
                    percent: model,
                    lineHeight: 12,
                    width: MediaQuery.of(context).size.width - 80,
                    animation: true,
                    animationDuration: 2000,
                    progressColor: Colors.amber,
                    backgroundColor: Colors.yellow,
                    barRadius: Radius.circular(10),
                  );
              }, error: (e, _) => Text(e.toString()), loading: () => const SizedBox.shrink()),
              // child: FutureBuilder(
              //   future: ref.watch(asyncGoalsProvider.notifier).checkFastingGoal(),
              //   builder: (context, asyncSnapshot) {
              //     if (!asyncSnapshot.hasData) {
              //       return const Text('No ongoing Fasting goal');
              //     }

              //     final model = asyncSnapshot.data;

              //     if (model == null || model == -1) {
              //       return const Text('No ongoing Fasting goal');
              //     }
              //     //! Calculate the progress here somehow

              //     debugPrint('In Goals');

              //     return LinearPercentIndicator(
              //       percent: model,
              //       lineHeight: 12,
              //       width: MediaQuery.of(context).size.width - 80,
              //       animation: true,
              //       animationDuration: 2000,
              //       progressColor: Colors.amber,
              //       backgroundColor: Colors.yellow,
              //       barRadius: Radius.circular(10),
              //     );
              //   },
              // ),
            ),
            StreamBuilder(
              stream: ref.watch(gDaoProvider).getActiveFastingStreak(),
              builder: (context, asyncSnapshot) {
                if (!asyncSnapshot.hasData) {
                  return const Text('No ongoing Fasting streak');
                }

                final days = asyncSnapshot.data;

                if (days == null || days < 1) {
                  return const SizedBox.shrink();
                }
                //! Calculate the progress here somehow

                return Text('You\'re on a $days streak!');
              },
            ),
            Padding(
              padding: EdgeInsets.all(30),
              // child: FutureBuilder(
              //   future: ref.read(asyncFatingNotifier.notifier).refreshProgress(),
              //   builder: (context, asyncSnapshot) {
              //     if (!asyncSnapshot.hasData || asyncSnapshot.connectionState == ConnectionState.waiting) {
              //       return const CircularProgressIndicator();
              //     }
              //     final perc = asyncSnapshot.data!;
              child: checkProgress.when(data: (perc) {
                return CircularPercentIndicator(
                    radius: 100,
                    percent: perc.percentage,
                    lineWidth: 40,
                    header: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: checkStatus.when(data: (status) {
                          return Text(
                            status.homeReminder,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: TextSizing.small),
                          );
                      }, error: (e, _) => Text(e.toString()), loading: () => SizedBox.shrink()),
                      // child: FutureBuilder(
                      //   future: ref
                      //       .read(asyncFatingNotifier.notifier)
                      //       .refreshFastingStatus(),
                      //   builder: (context, asyncSnapshot) {
                      //     if (!asyncSnapshot.hasData) {
                      //       return const CircularProgressIndicator();
                      //     }
                      //     final status = asyncSnapshot.data!;
                      //     return Text(
                      //       status.homeReminder,
                      //       // "You're only an hour away from the end",
                      //       maxLines: 2,
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontSize: TextSizing.small),
                      //     );
                      //   },
                      // ),
                    ),
                    center: Text('${perc.remaining.inHours}h ${perc.remaining.inMinutes % 60}m', style: TextStyle(fontSize: TextSizing.small),),
                    progressColor: Colors.lightBlueAccent,
                    backgroundColor: Colors.cyan,
                    circularStrokeCap: CircularStrokeCap.round,
                    animationDuration: 500,
                  );
              }, error: (e, _) => Text(e.toString()), loading: () => SizedBox.shrink()),

                  
                // }
              ),
            // ),
          ],
        ),
      ),
      drawer: MyNavigationDrawer(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MyExpandableFAB(index: 1),
      // floatingActionButton: customWidgets.getFAB(ref, context, 1),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.purpleAccent,
      //   onPressed: () {

      //   }),
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
