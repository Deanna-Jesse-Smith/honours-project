import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/goals_pages/goals_page.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/main_app_bar.dart';
import 'package:testrun/widgets/navigation_drawer.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class HydrationTracking extends ConsumerWidget {
  const HydrationTracking({super.key});

  // double amount = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsNotifier = ref.watch(asyncGoalsProvider.notifier);
    final session = ref.watch(userSessionProvider).value;

    ref.read(gDaoProvider).checkGoals();

    return Scaffold(
      appBar: MainAppBar.appBar('Hydration Tracking', session!.userName),
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
              child: FutureBuilder(
                future: goalsNotifier.checkGoal(GoalType.hydration),
                builder: (context, asyncSnapshot) {
                  if (!asyncSnapshot.hasData) {
                    return Text('No ongoing goal');
                  }

                  final model = asyncSnapshot.data;

                  if (model == null || model == -1) {
                    return Text('No ongoing goal');
                  }

                  // if (model.isComplete) {
                  //   goalsNotifier.finishGoal(model.goalID, streakID: model.streakID);

                  //   //! whatever happens when a goal is completed
                  // }

                  return LinearPercentIndicator(
                    percent: model,
                    lineHeight: 10,
                    width: MediaQuery.of(context).size.width - 80,
                    animation: true,
                    animationDuration: 2000,
                    progressColor: Colors.amber,
                    backgroundColor: Colors.black,
                  );
                }
              ),
            ),
            StreamBuilder(
                stream: ref.watch(gDaoProvider).getActiveHydrationStreak(),
                builder: (context, asyncSnapshot) {
                  if (!asyncSnapshot.hasData) {
                    return const Text('No ongoing Fasting streak');
                  }

                  final days = asyncSnapshot.data;

                  if (days == null) {
                    return const SizedBox.shrink();
                  }
                  //! Calculate the progress here somehow

                  return Text('You\'re on a $days streak!');
                }
              ),
            SizedBox(
              width: 100,
              height: 100,
              child: StreamBuilder(
                stream: ref.watch(hDaoProvider).watchTodayHydration(session.userId, DateTime.now()),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.connectionState == ConnectionState.waiting) return const CircularProgressIndicator();
                  
                  final am = asyncSnapshot.data!;

                  final prog = 1 <= 0 ? 0.0 : (am / 1).clamp(0.0, 1.0);
                  
                  return LiquidCircularProgressIndicator(
                    value: prog,
                    valueColor: AlwaysStoppedAnimation( Colors.lightBlue),
                    backgroundColor: Colors.white,
                    // borderColor: Colors.red,
                    // borderWidth: 5.0,
                    direction: Axis.vertical,
                    center: Text("Get drinking!"),
                    // shapePath: buildBottlePath(const Size(100, 180)),
                  );
                }
              ),
              // child: LiquidCircularProgressIndicator(
              //   value: amount, // Defaults to 0.5.
              //   valueColor: AlwaysStoppedAnimation(
              //     Colors.pink,
              //   ), // Defaults to the current Theme's accentColor.
              //   backgroundColor: Colors
              //       .white, // Defaults to the current Theme's backgroundColor.
              //   borderColor: Colors.red,
              //   borderWidth: 5.0,
              //   direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
              //   center: Text("Loading..."),
              // ),
            ),
            ElevatedButton(onPressed: () async {
              final newAmount = await Dialogs.getSpinnerWaterInput(context, title: 'How many cups have you drank?');
              if (newAmount != null) ref.read(hDaoProvider).addHydration(session.userId, DateTime.now(), newAmount);
            }, child: Text('Log Hydration'))
          ],
        ),
      ),
      drawer: MyNavigationDrawer(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MyExpandableFAB(index: 4),
            persistentFooterButtons: [
        Row(
          spacing: 30,
          children: [
          //   ElevatedButton(
          //   onPressed: () => {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const FastingHistory()),
          //     ),
          //   },
          //   child: Text(
          //     'View Fasting History',
          //     style: Theme.of(context).textTheme.displayMedium,
          //   ),
          // ),
          ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoalsPage(type: GoalType.hydration))), child: Text(
              'Goals/Streaks',
              style: Theme.of(context).textTheme.displayMedium,
            ))
          ]
        ),
      ],
      // floatingActionButton: customWidgets.getFAB(ref, context, 4),
    );
  }
}

Path buildBottlePath(Size size) {
  final w = size.width;
  final h = size.height;
  final path = Path();

  final neckWidth = w * 0.35;
  final neckLeft = (w - neckWidth) / 2;
  final neckHeight = h * 0.15;

  path.moveTo(neckLeft, 0);
  path.lineTo(neckLeft + neckWidth, 0);
  path.lineTo(neckLeft + neckWidth, neckHeight);

  // Shoulder curve out to full body width
  path.quadraticBezierTo(
    neckLeft + neckWidth, neckHeight + h * 0.05,
    w, neckHeight + h * 0.12,
  );

  // Body down to base
  path.lineTo(w, h - h * 0.05);
  path.quadraticBezierTo(w, h, w - w * 0.05, h);
  path.lineTo(w * 0.05, h);
  path.quadraticBezierTo(0, h, 0, h - h * 0.05);

  // Body up to shoulder
  path.lineTo(0, neckHeight + h * 0.12);
  path.quadraticBezierTo(
    0, neckHeight + h * 0.05,
    neckLeft, neckHeight,
  );

  path.close();
  return path;
}