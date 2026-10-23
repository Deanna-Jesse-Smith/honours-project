import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/goals_pages/goals_page.dart';
import 'package:testrun/utils/notifiers/concerns_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/animated_liquid_progress.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class HydrationTracking extends ConsumerStatefulWidget {
  const HydrationTracking({super.key});

  @override
  ConsumerState<HydrationTracking> createState() => HydrationTrackingState();
}

class HydrationTrackingState extends ConsumerState<HydrationTracking> {
  final DateTime sevenDaysAgo = DateTime.now().subtract(const Duration(days: 6));

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final concern = await ref
          .read(asyncConcernsProvider.notifier)
          .getConcern(GoalType.hydration);

      if (!mounted) return;

      if (concern != null) {
        await ref
            .read(asyncConcernsProvider.notifier)
            .doConcernDialogue(concern, context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final goalChecker = ref.watch(checkHydrationGoalProvider);
    final streakChecker = ref.watch(checkHydrationStreakProvider);
    final graphChecker = ref.watch(watchHydrationGraphProvider(sevenDaysAgo));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hydration Tracking',
          style: TextStyle(fontSize: TextSizing.large),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: goalChecker.when(
                data: (goal) {
                  final model = goal.$1 == -1 ? 0.0 : goal.$1;

                  return Column(
                    children: [
                      AnimatedLiquidProgress(progress: model),
                      Text('${goal.$2.toStringAsFixed(2)} l / ${goal.$3.toStringAsFixed(2)} l', 
                      style: const TextStyle(fontSize: TextSizing.medium)),
                    ],
                  );
                },
                error: (e, l) => Text(e.toString()),
                loading: () => Text('Loading'),
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
                      const Tooltip(
                        message:
                            'Your hydration streak is the number of days in a row you have managed to reach your hydration goal.',
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
                        'You\'re on a $streak day streak!',
                        style: TextStyle(fontSize: TextSizing.medium),
                      ),
                    ],
                  );
                }
              },
              error: (e, _) => Text(e.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(width: 100, height: 30),

            const Text('Your week\'s hydration', style: TextStyle(fontSize: TextSizing.medium)),
            const SizedBox(width: 100, height: 20),

            graphChecker.when(
              data: (logs) {
                if (logs.isEmpty) {
                  return const Text('No hydration logs yet.');
                } else {
                  DateTime cur = sevenDaysAgo;
                  final today = DateUtils.dateOnly(DateTime.now()), limit = today.add(const Duration(days: 1));
                  final List<(DateTime, double)> filledLogs = [];

                  int loop = 0;
                  do {
                    if (loop < logs.length && DateUtils.isSameDay(logs[loop].$1, cur)) {
                      filledLogs.add(logs[loop]);
                      loop++;
                    } else if (!filledLogs.contains((cur, 0.0))) {
                      filledLogs.add((cur, 0.0));
                    }
                    cur = cur.add(const Duration(days: 1));
                  } while (cur.isBefore(limit));
                  return SizedBox(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: filledLogs.map((e) => e.$2).reduce(max) + 0.5,
                        lineBarsData: [
                          LineChartBarData(
                            spots: filledLogs
                                .map(
                                  (log) => FlSpot(
                                    log.$1.millisecondsSinceEpoch
                                        .toDouble(),
                                    log.$2,
                                  ),
                                )
                                .toList(),
                            color: Colors.blue,
                            preventCurveOverShooting: true,
                            isCurved: true,
                            barWidth: 5,
                            dotData: FlDotData(show: false),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                              getTitlesWidget: (value, meta) {
                                return Text('${value.toStringAsFixed(2)} l', style: const TextStyle(fontSize: 12));
                              },
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: const Duration(days: 1).inMilliseconds.toDouble(),
                              getTitlesWidget: (value, meta) {
                                final date =
                                    DateTime.fromMillisecondsSinceEpoch(
                                      value.toInt(),
                                    );
                                return Text(DateFormat('E').format(date));
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
              error: (e, _) => Text(e.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
      drawer: MyNavigationDrawer(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MyExpandableFAB(index: 4),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GoalsPage(type: GoalType.hydration),
                ),
              ),
              child: Text(
                'Set Hydration Goal',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
            ),
      ],
    );
  }
}
