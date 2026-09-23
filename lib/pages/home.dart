import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/animations/animated_circular_percent.dart';
import 'package:testrun/widgets/animations/celebration_title.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => HomePageState();
}

bool firstHomeFrame = false;

class HomePageState extends ConsumerState<HomePage> {
  late UserSessionData session;

  @override
  void initState() {
    super.initState();
    session = ref.watch(userSessionProvider).value!;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await ref.read(fDaoProvider).dummyData();
      // await ref.read(cDaoProvider).dummyData();
      // final check = await ref
      //     .read(asyncGoalsProvider.notifier)
      //     .checkFastingGoal();

      // if (!check || !mounted) return;
      // await showDialog(
      //   context: context,
      //   builder: (_) => DialogTitle(type: GoalType.fasting),
      // );
      if (!firstHomeFrame) {
        firstHomeFrame = true;
        final checkFood = await ref
            .read(asyncGoalsProvider.notifier)
            .checkFastingGoal();

        if (!checkFood || !mounted) return;
        await showDialog(
          context: context,
          builder: (_) => DialogTitle(type: GoalType.fasting),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final checkGoal = ref.watch(checkFastingGoalProvider);
    // final checkStatus = ref.watch(checkFastingStatusProvider);
    final checkProgress = ref.watch(checkFastingProgressProvider);
    final streakChecker = ref.watch(checkFastingStreakProvider);
    // ref.read(fDaoProvider).dummyData();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, ${session.userName}',
          style: TextStyle(fontSize: TextSizing.large),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: checkGoal.when(
                data: (goal) {
                  final model = goal > -1 ? goal : 0.01;
                  return LinearPercentIndicator(
                    alignment: MainAxisAlignment.center,
                    percent: model,
                    lineHeight: 15,
                    width: MediaQuery.of(context).size.width - 80,
                    animation: true,
                    animationDuration: 2000,
                    progressColor: Colors.amber,
                    backgroundColor: Colors.yellow,
                    barRadius: Radius.circular(10),
                  );
                },
                error: (e, _) => Text(e.toString()),
                loading: () => const SizedBox.shrink(),
              ),
            ),
            streakChecker.when(
              data: (streak) {
                if (streak == null) {
                  return const SizedBox.shrink();
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                        message:
                            'Your fasting streak is the number of days in a row you have managed to maintain your fasting period.',
                        textStyle: TextStyle(fontSize: TextSizing.small),
                        constraints: BoxConstraints(maxWidth: 300),
                        triggerMode: TooltipTriggerMode.tap,
                        showDuration: Duration(seconds: 10),
                        child: SizedBox(
                          width: 50,
                          child: Icon(Icons.info_outline),
                        ),
                      ),
                      Text(
                        'You\'re on a $streak week streak!',
                        style: TextStyle(fontSize: TextSizing.medium),
                      ),
                    ],
                  );
                }
              },
              error: (e, _) => Text(e.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            // StreamBuilder(
            //   stream: ref.watch(gDaoProvider).getActiveFastingStreak(),
            //   builder: (context, asyncSnapshot) {
            //     if (!asyncSnapshot.hasData) {
            //       return const Text(
            //         'No ongoing Fasting streak',
            //         style: TextStyle(fontSize: TextSizing.smallmed),
            //       );
            //     }

            //     final days = asyncSnapshot.data;

            //     if (days == null || days < 1) {
            //       return const SizedBox.shrink();
            //     }

            //     return Text('You\'re on a $days week streak!',
            //         style: TextStyle(fontSize: TextSizing.smallmed));
            //   },
            // ),
            Padding(
              padding: EdgeInsets.all(30),
              child: checkProgress.when(
                data: (perc) {
                  return AnimatedCircularPercent(progress: perc);
                  // return CircularPercentIndicator(
                  //   radius: 130,
                  //   percent: perc.percentage,
                  //   lineWidth: 45,
                  //   header: Padding(
                  //     padding: EdgeInsets.only(bottom: 45),
                  //     child: checkStatus.when(
                  //       data: (status) {
                  //         return Text(
                  //           status.homeReminder,
                  //           maxLines: 2,
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(fontSize: TextSizing.medium),
                  //         );
                  //       },
                  //       error: (e, _) => Text(e.toString()),
                  //       loading: () => SizedBox.shrink(),
                  //     ),
                  //   ),
                  //   center: Text(
                  //     '${perc.remaining.inHours}h ${perc.remaining.inMinutes % 60}m',
                  //     style: TextStyle(fontSize: TextSizing.medium),
                  //   ),
                  //   progressColor: Colors.lightBlueAccent,
                  //   backgroundColor: Colors.cyan,
                  //   circularStrokeCap: CircularStrokeCap.round,
                  //   animationDuration: 2000,
                  // );
                },
                error: (e, _) => Text(e.toString()),
                loading: () => SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
      drawer: MyNavigationDrawer(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MyExpandableFAB(index: 1),
    );
  }
}
