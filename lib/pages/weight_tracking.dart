import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class WeightTracking extends ConsumerWidget {
  const WeightTracking({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsNotifier = ref.watch(asyncGoalsProvider.notifier);
    final session = ref.read(userSessionProvider).value;
    late double curWeight;

    return Scaffold(
      appBar: MainAppBar.appBar('Weight Tracking', session!.userName),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Weight Motivation',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: FutureBuilder(
                future: goalsNotifier.checkGoal(GoalType.weight),
                builder: (context, asyncSnapshot) {
                  if (!asyncSnapshot.hasData) {
                    return Text('No ongoing goal');
                  }

                  final model = asyncSnapshot.data;

                  if (model == null || model == -1) {
                    return Text('No ongoing goal');
                  }
                  // model.calculateComplete(curWeight!);

                  // if (model.isComplete) {
                  //   ref.read(gDaoProvider).finishGoal(model.goalID, -1);

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
                },
              ),
            ),
            SizedBox(width: 100, height: 100),
            StreamBuilder(stream: ref.watch(wDaoProvider).getCurWeight(session.userId), builder: (context, asyncSnapshot) {
              if (!asyncSnapshot.hasData) {
                curWeight = 0;
                return const Text('No weight history');
              }

              curWeight = asyncSnapshot.data ?? 0;

              return Text('$curWeight kg');
            }),
            ElevatedButton(
              onPressed: () async {
                final newAmount = await Dialogs.getNewInput(
                  context,
                  initialVal: curWeight,
                  title: 'Log Weight',
                );
                if (newAmount != null) {
                  ref
                      .read(wDaoProvider)
                      .insertWeight(
                        session.userId,
                        newAmount.toDouble(),
                        DateTime.now(),
                      );
                }
              },
              child: Text('Log Weight'),
            ),
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
          ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoalsPage(type: GoalType.weight))), child: Text(
              'Goals/Streaks',
              style: TextStyle(fontSize: TextSizing.medium),
            ))
          ]
        ),
      ],
      // floatingActionButton: customWidgets.getFAB(ref, context, 4),
    );
  }

  FutureOr<double> getLatestWeight(WidgetRef ref) async {
    final latest = await ref.read(wDaoProvider).latestWeight(0);

    return latest ?? 0;
  }

  // Future<double> getTodayHydration() async {
  //   final todays = await getIt<HydrationDao>().getTodayHydration(userState.userID, DateTime.now());

  //   double sum = 0;

  //   for (var log in todays) {
  //     sum += log.amount;
  //   }

  //   return sum;
  // }
}
