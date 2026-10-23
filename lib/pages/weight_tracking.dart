import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/goals_pages/goals_page.dart';
import 'package:testrun/utils/notifiers/concerns_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/animations/celebration_title.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/navigation_drawer.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WeightTracking extends ConsumerStatefulWidget {
  const WeightTracking({super.key});

  @override
  ConsumerState<WeightTracking> createState() => _WeightTrackingState();
}

class _WeightTrackingState extends ConsumerState<WeightTracking> {
  late Future<double> goalProgress;

  final DateTime start = DateTime.now().subtract(const Duration(days: 30));
  final DateTime twoMonthsAgo = DateTime.now().subtract(
    const Duration(days: 30),
  );
  final DateTime now = DateUtils.dateOnly(DateTime.now());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final concern = await ref
          .read(asyncConcernsProvider.notifier)
          .getConcern(GoalType.weight);

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
    final ref = this.ref;
    final session = ref.read(userSessionProvider).value;
    late double curWeight;

    final watchWeightGoal = ref.watch(checkWeightGoalProvider);
    final graphChecker = ref.watch(watchWeightGraphProvider(twoMonthsAgo));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weight Tracking',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: watchWeightGoal.when(
                data: (goal) {
                  if (goal.$3 == -1) {
                    return const Text(
                      'No ongoing weight goal',
                      style: TextStyle(fontSize: TextSizing.medium),
                    );
                  }

                  final model = goal.$2 == -1 ? 0.0 : goal.$2;

                  return Center(
                    child: LinearPercentIndicator(
                      alignment: MainAxisAlignment.center,
                      percent: model,
                      lineHeight: 15,
                      width: MediaQuery.of(context).size.width * 0.6,
                      animation: true,
                      animationDuration: 1000,
                      progressColor: Colors.amber,
                      backgroundColor: Colors.yellow,
                      leading: Text(
                        '${goal.$1}',
                        style: TextStyle(fontSize: TextSizing.smallmed),
                      ),
                      trailing: Text(
                        '${goal.$3}',
                        style: TextStyle(fontSize: TextSizing.smallmed),
                      ),
                      barRadius: Radius.circular(10),
                    ),
                  );
                },
                error: (e, l) => Text(e.toString()),
                loading: () => Text('No Goal'),
              ),
            ),
            SizedBox(width: 100, height: 100),
            StreamBuilder(
              stream: ref.watch(wDaoProvider).getCurWeight(session!.userId),
              builder: (context, asyncSnapshot) {
                if (!asyncSnapshot.hasData) {
                  curWeight = 0;
                  return const Text('No weight history');
                }

                curWeight = asyncSnapshot.data ?? 0;

                return Text(
                  '$curWeight kg',
                  style: TextStyle(fontSize: TextSizing.large),
                );
              },
            ),
            const SizedBox(height: 20),

            graphChecker.when(
              data: (logs) {
                if (logs.isEmpty) {
                  return const Text(
                    'No weight logs in the past month',
                    style: TextStyle(fontSize: TextSizing.medium),
                  );
                } else {
                  DateTime cur = DateUtils.dateOnly(start);
                  final today = DateUtils.dateOnly(DateTime.now());
                  final limit = today.add(const Duration(days: 1));
                  List<(DateTime, double)> filledLogs = [];
                  double first = logs.first.$2;
                  double? last;

                  int loop = 0;
                  do {
                    if (loop < logs.length &&
                        DateUtils.isSameDay(logs[loop].$1, cur)) {
                      while (loop < logs.length &&
                          DateUtils.isSameDay(logs[loop].$1, cur)) {
                        last = logs[loop].$2;
                        loop++;
                      }
                      filledLogs.add((cur, last!));
                    } else {
                      filledLogs.add((cur, last ?? first));
                    }
                    cur = cur.add(const Duration(days: 1));
                  } while (cur.isBefore(limit));

                  return SizedBox(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        minY: filledLogs.map((e) => e.$2).reduce(min) - 0.5,
                        maxY: filledLogs.map((e) => e.$2).reduce(max) + 0.5,
                        lineBarsData: [
                          LineChartBarData(
                            spots: filledLogs
                                .map(
                                  (log) => FlSpot(
                                    DateUtils.dateOnly(
                                      log.$1,
                                    ).millisecondsSinceEpoch.toDouble(),
                                    log.$2,
                                  ),
                                )
                                .toList(),
                            color: const Color.fromARGB(255, 11, 156, 71),
                            preventCurveOverShooting: true,
                            isCurved: true,
                            barWidth: 5,
                            dotData: FlDotData(show: false),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '${value.toStringAsFixed(2)} kg',
                                  style: const TextStyle(fontSize: 12),
                                );
                              },
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: const Duration(
                                days: 1,
                              ).inMilliseconds.toDouble(),
                              getTitlesWidget: (value, meta) {
                                final date =
                                    DateTime.fromMillisecondsSinceEpoch(
                                      value.toInt(),
                                    );
                                if (date.day != 1 &&
                                    !DateUtils.isSameDay(date, now)) {
                                  return const SizedBox.shrink();
                                }

                                return Text(DateFormat('MMMd').format(date));
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
      floatingActionButton: MyExpandableFAB(index: 2),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  GoalsPage(type: GoalType.weight, startWeight: curWeight),
            ),
          ),
          child: Text(
            'Set Weight Goal',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ),
      ],
    );
  }

  void celebrate() {
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (_) => DialogTitle(type: GoalType.weight),
    );
  }
}
