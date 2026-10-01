import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/statistics_model.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';

class FastingHistory extends ConsumerStatefulWidget {
  const FastingHistory({super.key});

  @override
  ConsumerState<FastingHistory> createState() => _FastingHistoryState();
}

const List<String> months = <String>[
  'January',
  'Feb',
  'March',
  'April',
  'May',
  'June',
  'July',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

final fastsInMonthProvider = StreamProvider.autoDispose
    .family<
      StatisticsModel,
      ({FastingForm curForm, DateTime start, DateTime end})
    >((ref, params) {
      final repo = ref
          .watch(fDaoProvider)
          .findFastsInRange(params.start, params.end);

      return repo.map(
        (fasts) => StatisticsModel(curFasts: fasts, curForm: params.curForm),
      );
    });

class _FastingHistoryState extends ConsumerState<FastingHistory> {
  int thisMonth = DateTime.now().month - 1, thisYear = DateTime.now().year;
  late int daysInMonth, firstWeekday, totalCells;
  Stream<List<FastLogData>> data = Stream.empty();
  Stream<StatisticsModel> sm = Stream.empty();
  late DateTime start, end;
  late String bestStreak;
  late FastingForm curForm;

  late Stream<StatisticsModel> sms;
  late Stream<List<FastLogData>> fasts;
  // late UserSessionData session;

  @override
  void initState() {
    DateTime focusMonth = DateTime(thisYear, thisMonth + 1);
    start = DateTime(focusMonth.year, focusMonth.month, 1);

    daysInMonth = DateUtils.getDaysInMonth(focusMonth.year, focusMonth.month);
    end = DateTime(focusMonth.year, focusMonth.month, daysInMonth, 23, 59, 59);
    firstWeekday = start.weekday - 1;
    totalCells = firstWeekday + daysInMonth;
    final session = ref.watch(userSessionProvider).value;
    curForm = session!.fastingForm;

    // session = ref.watch(userSessionProvider).value!;

    final outcome = ref.read(bestStreakProvider(GoalType.fasting));

    bestStreak = outcome.when(
      data: (streak) {
        if (streak == null) {
          return '\n\nYou have no fasting streaks recorded.';
        }
        return '\n\nYour best streak is $streak days';
      },
      error: (e, _) => '',
      loading: () => '',
    );

    resetStreams();
    super.initState();
  }

  void resetStreams() {
    data = ref.watch(fDaoProvider).findFastsInRange(start, end);

    sms = data.map(
      (convert) => StatisticsModel(curFasts: convert, curForm: curForm),
    );
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(userSessionProvider).value;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fasting History',
          style: TextStyle(
            color: Colors.black,
            fontSize: TextSizing.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => {Navigator.of(context).pop()},
        ),
        actions: [
          Tooltip(
            message: '',
            triggerMode: TooltipTriggerMode.tap,
            child: IconButton(
              onPressed: () => Dialogs.getFastResultHelp(context),
              icon: const Icon(Icons.question_mark),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: const Icon(Icons.arrow_back),
                  onTap: () {
                    setState(() {
                      if (thisMonth - 1 == -1) {
                        thisMonth = 11;
                        thisYear = thisYear - 1;
                      } else {
                        thisMonth = thisMonth - 1;
                      }
                      changeFocus(thisYear, thisMonth, session!);
                    });
                  },
                ),
                Text(
                  '${months[thisMonth]} $thisYear',
                  style: const TextStyle(fontSize: TextSizing.medium),
                ),
                GestureDetector(
                  child: const Icon(Icons.arrow_forward),
                  onTap: () {
                    setState(() {
                      if (thisMonth + 1 == 12) {
                        thisMonth = 0;
                        thisYear = thisYear + 1;
                      } else {
                        thisMonth = thisMonth + 1;
                      }
                      changeFocus(thisYear, thisMonth, session!);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: daysOfWeek
                  .map(
                    (day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            // Expanded(child: getCalendar(session!)),
            StreamBuilder<List<FastLogData>>(
              stream: data,
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final fasts = asyncSnapshot.data!;

                // debugPrint('Number of fasts in: ${months[thisMonth]} is ${fasts.length}');
                // sm = StatisticsModel(curFasts: fasts, curForm: session.fastingForm);

                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisExtent: 90,
                  ),
                  itemCount: totalCells,
                  itemBuilder: (context, index) {
                    if (index < firstWeekday) {
                      return const SizedBox.shrink();
                    }
                    final day = index - firstWeekday + 1;
                    final log = fasts
                        .where(
                          (f) =>
                              f.startDateTime.year == thisYear &&
                              f.startDateTime.month == thisMonth + 1 &&
                              f.startDateTime.day == day,
                        )
                        .firstOrNull;

                    if (log != null) {
                      return fastDay(day, log);
                    }
                    return emptyDay(day);
                  },
                );
              },
            ),
            const SizedBox(height: 35),
            StreamBuilder(
              stream: sms,
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  debugPrint('SMS: waiting');
                  return const CircularProgressIndicator();
                }
                if (asyncSnapshot.hasError) {
                  debugPrint('SMS: ${asyncSnapshot.error}');
                  return const CircularProgressIndicator();
                }
                if (!asyncSnapshot.hasData) {
                  debugPrint('SMS: null');
                  return const CircularProgressIndicator();
                }
                StatisticsModel sm = asyncSnapshot.data!;
                final startDeviation = sm.curFasts.averageStartDeviation
                    .round();
                final endDeviation = sm.curFasts.averageEndDeviation.round();
                debugPrint('SMS rebuild ${sm.getLength()}');
                // final longestTRE = sm.getLongestTRE();
                // return Column(
                //   children: [
                //     Text(bestStreak, style: const TextStyle(fontSize: TextSizing.medium),),
                //     Text(
                //       'Total Hours Fasted in ${months[thisMonth]}: ${sm.getTotalForMonth(thisYear, thisMonth)} hours',
                //       style: const TextStyle(fontSize: TextSizing.medium),
                //     ),
                //     Text('Longest Fast: ${longestTRE.inHours} hours ${longestTRE.inMinutes % 60}', style: const TextStyle(fontSize: TextSizing.medium),),
                //   ],
                // );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  spacing: 5,
                  children: [
                    const Text(
                      'Fasting Statistics',
                      style: TextStyle(
                        fontSize: TextSizing.large,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Fasts completed: ${sm.numCompleted()}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                      textAlign: TextAlign.left,
                    ),

                    Text(
                      'Plan adherence: ${sm.getAsPlannedRate()}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    Text(
                      'Total time fasted: ${sm.getTotalForMonth()}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    Text(
                      'Average fast: ${sm.getAverage() ?? 'N/A'}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    Text(
                      'Longest fast: ${sm.getLongestTimed() ?? 'N/A'}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    Text(
                      bestStreak,
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Starting',
                      style: TextStyle(
                        fontSize: TextSizing.medium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Started on time: ${sm.onTimeStartCount()}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    Text(
                      'Started early: ${sm.curFasts.earlyStartCount}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    Text(
                      'Started late: ${sm.curFasts.lateStartCount}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    if (sm.curFasts.earlyStartCount +
                            sm.curFasts.lateStartCount >
                        0)
                      Text(
                        'Average start deviation: '
                        '${startDeviation.abs()} min '
                        '${startDeviation < 0
                            ? 'early'
                            : startDeviation > 0
                            ? 'late'
                            : 'on time'}',
                        style: const TextStyle(fontSize: TextSizing.medium),
                      ),

                    const SizedBox(height: 12),

                    const Text(
                      'Ending',
                      style: TextStyle(
                        fontSize: TextSizing.medium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Ended on time: ${sm.onTimeEndCount()}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    Text(
                      'Ended early: ${sm.curFasts.earlyEndCount}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    Text(
                      'Ended late: ${sm.curFasts.lateEndCount}',
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),

                    if (sm.curFasts.earlyEndCount + sm.curFasts.lateEndCount >
                        0)
                      Text(
                        'Average end deviation: '
                        '${endDeviation.abs()} min '
                        '${endDeviation < 0
                            ? 'early'
                            : endDeviation > 0
                            ? 'late'
                            : 'on time'}',
                        style: const TextStyle(fontSize: TextSizing.medium),
                      ),

                    if (sm.curForm == FastingForm.fiveTwo) ...[
                      const SizedBox(height: 12),

                      const Text(
                        '5:2 Statistics',
                        style: TextStyle(
                          fontSize: TextSizing.medium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        'Fast days skipped: ${sm.curFasts.skippedCount}',
                        style: const TextStyle(fontSize: TextSizing.medium),
                      ),

                      Text(
                        'Fast days interrupted: ${sm.curFasts.interruptedCount}',
                        style: const TextStyle(fontSize: TextSizing.medium),
                      ),

                      Text(
                        'Overate: ${sm.curFasts.overAte}',
                        style: const TextStyle(fontSize: TextSizing.medium),
                      ),

                      Text(
                        'Underate: ${sm.curFasts.underAte}',
                        style: const TextStyle(fontSize: TextSizing.medium),
                      ),
                    ],

                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void changeFocus(int curYear, int curMonth, UserSessionData session) {
    setState(() {
      DateTime focusMonth = DateTime(curYear, curMonth + 1);
      start = DateTime(focusMonth.year, focusMonth.month, 1);
      end = DateTime(focusMonth.year, focusMonth.month + 1, 0);
      daysInMonth = DateUtils.getDaysInMonth(focusMonth.year, focusMonth.month);
      firstWeekday = start.weekday - 1;
      totalCells = firstWeekday + daysInMonth;

      resetStreams();
    });
  }

  Padding emptyDay(int day) {
    return .new(
      padding: EdgeInsets.all(4.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            '$day',
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Padding fastDay(int day, FastLogData log) {
    return .new(
      padding: EdgeInsets.all(4.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                '$day',
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            const SizedBox.shrink(),
            Expanded(
              child: Row(
                children: getIcons(
                  log,
                ).map((i) => Expanded(child: FittedBox(child: i))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Icon> getIcons(FastLogData log) {
    // List<String> strList = log.fastResult.split(',');
    // List<Icon> frList = List.empty(growable: true);
    // final converter = FastResultConverter();

    // for (String res in strList) {
    //   frList.add(converter.fromSql(res).resultIcon);
    // }

    return log.lateFastResult != null
        ? [log.earlyFastResult.resultIcon, log.lateFastResult!.resultIcon]
        : [log.earlyFastResult.resultIcon];
  }

  StreamBuilder getCalendar(UserSessionData session) {
    return StreamBuilder<List<FastLogData>>(
      // stream: ref
      //     .watch(fDaoProvider)
      //     .findFasts(
      //       1
      //     ),
      stream: ref.watch(fDaoProvider).findFastsInRange(start, end),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final fasts = asyncSnapshot.data!;

        // sm = StatisticsModel(curFasts: fasts, curForm: session.fastingForm);

        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisExtent: 90,
          ),
          itemCount: totalCells,
          itemBuilder: (context, index) {
            if (index < firstWeekday) {
              return const SizedBox.shrink();
            }
            final day = index - firstWeekday + 1;
            final log = fasts
                .where(
                  (f) =>
                      f.startDateTime.year == thisYear &&
                      f.startDateTime.month == thisMonth + 1 &&
                      f.startDateTime.day == day,
                )
                .firstOrNull;

            if (log != null) {
              return fastDay(day, log);
            }
            return emptyDay(day);
          },
        );
      },
    );
  }

  GridView getCalendarr(UserSessionData session) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: totalCells,
      itemBuilder: (context, index) {
        if (index < firstWeekday) {
          return const SizedBox.shrink();
        }
        final day = index - firstWeekday + 1;
        // final log = dayByDay[day];

        // if (log == null) {
        //   return emptyDay(day: day);
        // }
        // return fastDay(day: day, log: log);
        return Padding(
          padding: EdgeInsets.all(4.0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                '$day',
                style: const TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
        );
      },
    );
  }
}

final fastStatisticsProvider =
    Provider.family<StatisticsModel, (List<FastLogData>, FastingForm)>((
      ref,
      data,
    ) {
      return StatisticsModel(curFasts: data.$1, curForm: data.$2);
    });
