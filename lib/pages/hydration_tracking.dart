import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/concerns_model.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/goals_pages/goals_page.dart';
import 'package:testrun/utils/Notifiers/concerns_notifier.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/main_app_bar.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class HydrationTracking extends ConsumerStatefulWidget {
  const HydrationTracking({super.key});

  @override
  ConsumerState<HydrationTracking> createState() => HydrationTrackingState();
}

class HydrationTrackingState extends ConsumerState<HydrationTracking> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final concern = await ref.read(asyncConcernsProvider.notifier).getConcern(GoalType.hydration);

      if (!mounted) return;

      if (concern != null) {
        await ref.read(asyncConcernsProvider.notifier).doConcernDialogue(concern, context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.read(userSessionProvider).value;
    final goalChecker = ref.watch(checkHydrationGoalProvider);
    final streakChecker = ref.watch(checkHydrationStreakProvider);

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
              child: goalChecker.when(data: (goal) {
                final model = goal == -1 ? 0.0 : goal;
                return SizedBox(
                    width: 150,
                    height: 150,
                    child: LiquidCircularProgressIndicator(
                          value: model,
                          valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                          backgroundColor: Colors.white,
                          // borderColor: Colors.red,
                          // borderWidth: 5.0,
                          direction: Axis.vertical,
                          // shapePath: buildBottlePath(const Size(100, 180)),
                        ),
                  );
              }, error: (e, l) => Text(e.toString()), loading: () => Text('Loading'))
            ),
            streakChecker.when(data: (streak) {
              if (streak == null) {
                return const SizedBox.shrink();
              } else {
                return Text('You\'re on a $streak day streak!', style: TextStyle(fontSize: TextSizing.medium),);
              }
            }, error: (e, _) => Text(e.toString()), loading: () => const CircularProgressIndicator()),
            SizedBox(
              width: 100,
              height: 100,
            ),
            ElevatedButton(
              onPressed: () async {
                final newAmount = await Dialogs.getSpinnerWaterInput(
                  context,
                  title: 'How many cups have you drank?',
                );
                if (newAmount != null) {
                  await ref.read(asyncGoalsProvider.notifier).addHydration(newAmount).whenComplete(() => ref.invalidate(checkHydrationGoalProvider));
                }
              },
              child: Text('Log Hydration'),
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
                  builder: (context) => GoalsPage(type: GoalType.hydration),
                ),
              ),
              child: Text(
                'Goals/Streaks',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
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
    neckLeft + neckWidth,
    neckHeight + h * 0.05,
    w,
    neckHeight + h * 0.12,
  );

  // Body down to base
  path.lineTo(w, h - h * 0.05);
  path.quadraticBezierTo(w, h, w - w * 0.05, h);
  path.lineTo(w * 0.05, h);
  path.quadraticBezierTo(0, h, 0, h - h * 0.05);

  // Body up to shoulder
  path.lineTo(0, neckHeight + h * 0.12);
  path.quadraticBezierTo(0, neckHeight + h * 0.05, neckLeft, neckHeight);

  path.close();
  return path;
}
