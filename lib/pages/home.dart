import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/notifiers/goal_notifier.dart';
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
    final checkProgress = ref.watch(checkFastingProgressProvider);
    final streakChecker = ref.watch(checkFastingStreakProvider);

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
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: checkGoal.when(
                data: (goal) {
                  final model = goal.$1 > -1 ? goal.$1 : 0.01;
                  return LinearPercentIndicator(
                    alignment: MainAxisAlignment.center,
                    percent: model,
                    lineHeight: 15,
                    width: MediaQuery.of(context).size.width * 0.6,
                    animation: true,
                    animationDuration: 2000,
                    progressColor: Colors.amber,
                    backgroundColor: Colors.yellow,
                    barRadius: Radius.circular(10),
                    leading: Text(
                      '0',
                      style: TextStyle(fontSize: TextSizing.smallmed),
                    ),
                    trailing: Text(
                      '${goal.$3} days',
                      style: TextStyle(fontSize: TextSizing.smallmed),
                    ),
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
                            'Your fasting streak is the number of weeks in a row you have managed to achieve your fasting goal.',
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
            Padding(
              padding: EdgeInsets.all(30),
              child: checkProgress.when(
                data: (perc) {
                  return AnimatedCircularPercent(progress: perc);
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
      floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      floatingActionButton: const MyExpandableFAB(index: 1),
    );
  }
}
