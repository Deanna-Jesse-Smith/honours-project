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
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class HydrationTracking extends ConsumerStatefulWidget {
  const HydrationTracking({super.key});

  @override
  ConsumerState<HydrationTracking> createState() => HydrationTrackingState();
}

class HydrationTrackingState extends ConsumerState<HydrationTracking> {

  // late AsyncValue<double> goalChecker;
  // late AsyncValue<int?> streakChecker;

  @override
  void initState() {
    super.initState();

    // goalChecker = ref.watch(checkHydrationGoalProvider);
    // streakChecker = ref.watch(checkHydrationStreakProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final concern = await ref.read(asyncConcernsProvider.notifier).getConcern(GoalType.hydration);

      if (!mounted) return;

      if (concern != null) {
        await ref.read(asyncConcernsProvider.notifier).doConcernDialogue(concern, context);
      }
    });
  }

  // double amount = 0;
  @override
  Widget build(BuildContext context) {
    final session = ref.read(userSessionProvider).value;
    // final watching = ref.watch(watchHydrationProvider(DateTime.now()));
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
            // StreamBuilder(
            //   stream: ref.watch(gDaoProvider).getActiveHydrationStreak(),
            //   builder: (context, asyncSnapshot) {
            //     if (!asyncSnapshot.hasData) {
            //       return const Text('No ongoing hydration streak');
            //     }
            //     final days = asyncSnapshot.data;

            //     if (days == null) {
            //       return const SizedBox.shrink();
            //     }

            //     return Text('You\'re on a $days day streak!', style: TextStyle(fontSize: TextSizing.medium),);
            //   },
            // ),

            SizedBox(
              width: 100,
              height: 100,
              // child: watching.when(
              //   data: (amount) {
              //     return LiquidCircularProgressIndicator(
              //       value: 0.5,
              //       valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              //       backgroundColor: Colors.white,
              //       // borderColor: Colors.red,
              //       // borderWidth: 5.0,
              //       direction: Axis.vertical,
              //       center: Text("Get drinking!"),
              //       // shapePath: buildBottlePath(const Size(100, 180)),
              //     );
              //   },
              //   error: (_, _) => const CircularProgressIndicator(),
              //   loading: () => const CircularProgressIndicator(),
              // ),
              // child: StreamBuilder(
              //   stream: ref.watch(hDaoProvider).watchTodayHydration(session.userId, DateTime.now()),
              //   builder: (context, asyncSnapshot) {
              //     if (asyncSnapshot.connectionState == ConnectionState.waiting) return const CircularProgressIndicator();

              //     final am = asyncSnapshot.data!;

              //     final prog = 1 <= 0 ? 0.0 : (am / 1).clamp(0.0, 1.0);

              //     return LiquidCircularProgressIndicator(
              //       value: prog,
              //       valueColor: AlwaysStoppedAnimation( Colors.lightBlue),
              //       backgroundColor: Colors.white,
              //       // borderColor: Colors.red,
              //       // borderWidth: 5.0,
              //       direction: Axis.vertical,
              //       center: Text("Get drinking!"),
              //       // shapePath: buildBottlePath(const Size(100, 180)),
              //     );
              //   }
              // ),
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
            ElevatedButton(
              onPressed: () async {
                final newAmount = await Dialogs.getSpinnerWaterInput(
                  context,
                  title: 'How many cups have you drank?',
                );
                if (newAmount != null) {
                  await ref
                      .read(hDaoProvider)
                      .addHydration(session.userId, DateTime.now(), newAmount / 1000);
                      ref.invalidate(checkHydrationGoalProvider);
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
