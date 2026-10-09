import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
            StreamBuilder<List<FastLogData>>(
              stream: data,
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final fasts = asyncSnapshot.data!;

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
                  return const CircularProgressIndicator();
                }
                if (asyncSnapshot.hasError) {
                  return const CircularProgressIndicator();
                }
                if (!asyncSnapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                StatisticsModel sm = asyncSnapshot.data!;

                return statisticsColumn(sm, false);
              },
            ),
            const SizedBox(height: 20),

            FutureBuilder(
              future: ref.read(fDaoProvider).findAllFasts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final allFasts = snapshot.data ?? [];

                final allSms = StatisticsModel(
                  curFasts: allFasts,
                  curForm: curForm,
                );

                return statisticsColumn(allSms, true);
              },
            ),
          ],
        ),
      ),
    );
  }

  Column statisticsColumn(StatisticsModel sm, bool isAllTime) {
    final startDeviation = sm.curFasts.averageStartDeviation.round();
    final endDeviation = sm.curFasts.averageEndDeviation.round();
    // debugPrint('SMS rebuild ${sm.getLength()}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          isAllTime ? 'Fasting Statistics for All Time' : 'Fasting Statistics for ${months[thisMonth]} $thisYear',
          style: const TextStyle(
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
          'Plan adherence (recorded fasts): ${sm.getAsPlannedRate()}',
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

        Text(bestStreak, style: const TextStyle(fontSize: TextSizing.medium)),

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

        if (sm.curFasts.earlyStartCount + sm.curFasts.lateStartCount > 0)
          Text(
            'Average start deviation: '
            '${startDeviation.abs()} min '
            '${startDeviation < 0
                ? 'early'
                : startDeviation > 0
                ? 'late'
                : ''}',
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

        if (sm.curFasts.earlyEndCount + sm.curFasts.lateEndCount > 0)
          Text(
            'Average end deviation: '
            '${endDeviation.abs()} min '
            '${endDeviation < 0
                ? 'early'
                : endDeviation > 0
                ? 'late'
                : ''}',
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
    final endDateTime = log.endDateTime;
    final duration =
        endDateTime?.difference(log.startDateTime) ??
        DateTime.now().difference(log.startDateTime);

    String formatDateTime(DateTime dateTime) =>
        '${dateTime.year.toString()}-'
        '${dateTime.month.toString().padLeft(2, '0')}-'
        '${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}';

    final durationText =
        '${duration.inHours.toString().padLeft(2, '0')}:'
        '${(duration.inMinutes % 60).toString().padLeft(2, '0')}';

    return .new(
      padding: EdgeInsets.all(4.0),
      child: Tooltip(
        message:
            'Form: ${log.formIF.label}\n'
            'Fast Start: ${formatDateTime(log.startDateTime)}\n'
            'Fast End: ${endDateTime == null ? 'In progress' : formatDateTime(endDateTime)}\n'
            'Duration: $durationText${endDateTime == null ? ' (ongoing)' : ''}',
        textStyle: const TextStyle(fontSize: TextSizing.smallmed),
        constraints: const BoxConstraints(maxWidth: 300),
        triggerMode: TooltipTriggerMode.tap,
        showDuration: const Duration(seconds: 10),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(color: log.fastFormColour, width: 3.5),
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
      ),
    );
  }

  List<Icon> getIcons(FastLogData log) {
    return log.lateFastResult != null
        ? [log.earlyFastResult.resultIcon, log.lateFastResult!.resultIcon]
        : [log.earlyFastResult.resultIcon];
  }
}

