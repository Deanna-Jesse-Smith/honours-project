import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/goals_pages/goals_page.dart';
import 'package:testrun/utils/Notifiers/concerns_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/main_app_bar.dart';
import 'package:testrun/widgets/navigation_drawer.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WeightTracking extends ConsumerStatefulWidget {
  const WeightTracking({super.key});

  @override
  ConsumerState<WeightTracking> createState() => _WeightTrackingState();
}

class _WeightTrackingState extends ConsumerState<WeightTracking> {
  late Future<double> goalProgress;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final concern = await ref.read(asyncConcernsProvider.notifier).getConcern(GoalType.weight);

      if (!mounted) return;

      if (concern != null) {
        await ref.read(asyncConcernsProvider.notifier).doConcernDialogue(concern, context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final session = ref.read(userSessionProvider).value;
    late double curWeight;

    final watchWeightGoal = ref.watch(checkWeightGoalProvider);

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
            Padding(padding: EdgeInsets.all(15),
            child: watchWeightGoal.when(data: (goal) {
              if (goal.$3 == -1) {
                return const SizedBox.shrink();
              }

              final model = goal.$2 == -1 ? 0.0 : goal.$2;
              return Center(
                    child: LinearPercentIndicator(
                      percent: model,
                      lineHeight: 10,
                      width: MediaQuery.of(context).size.width * 0.6,
                      animation: true,
                      animationDuration: 2000,
                      progressColor: Colors.amber,
                      backgroundColor: Colors.yellow,
                      leading: Text('${goal.$1}'),
                      trailing: Text('${goal.$3}'),
                      barRadius: Radius.circular(10),
                    ),
                  );
            }, error: (e, l) => Text(e.toString()), loading: () => Text('No Gaol'))
            ),
            SizedBox(width: 100, height: 100),
            StreamBuilder(
              stream: ref.watch(wDaoProvider).getCurWeight(session.userId),
              builder: (context, asyncSnapshot) {
                if (!asyncSnapshot.hasData) {
                  curWeight = 0;
                  return const Text('No weight history');
                }

                curWeight = asyncSnapshot.data ?? 0;

                return Text('$curWeight kg', style: TextStyle(fontSize: TextSizing.large),);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final newAmount = await Dialogs.getNewInput(
                  context,
                  initialVal: curWeight,
                  title: 'Log Weight',
                );
                if (newAmount != null) {
                  await ref
                      .read(wDaoProvider)
                      .insertWeight(
                        session.userId,
                        newAmount.toDouble(),
                        DateTime.now(),
                      );
                  ref.invalidate(checkWeightGoalProvider);
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
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GoalsPage(type: GoalType.weight, startWeight: curWeight,),
                ),
              ),
              child: Text(
                'Goals/Streaks',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
