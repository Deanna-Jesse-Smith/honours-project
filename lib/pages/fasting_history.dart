import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
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
      ({int userID, FastingForm curForm, DateTimeRange range})
    >((ref, params) {
      final repo = ref.watch(fDaoProvider).findFastsInRange(1, params.range);

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

  late Stream<StatisticsModel> sms;
  late Stream<List<FastLogData>> fasts;

  @override
  void initState() {
    DateTime focusMonth = DateTime(thisYear, thisMonth + 1);
    start = DateTime(focusMonth.year, focusMonth.month, 1);
    end = DateTime(focusMonth.year, focusMonth.month + 1, 0);
    daysInMonth = end.day;
    // firstWeekday = start.weekday % 7;
    firstWeekday = start.weekday - 1;
    totalCells = firstWeekday + daysInMonth;

    resetStreams();
    super.initState();
  }

  void resetStreams() {
    final session = ref.watch(userSessionProvider).value;
    data = ref
        .watch(fDaoProvider)
        .findFastsInRange(1, DateTimeRange(start: start, end: end));

    sms = data.map(
      (convert) =>
          StatisticsModel(curFasts: convert, curForm: session!.fastingForm),
    );
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(userSessionProvider).value;
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
            message: 'Test',
            triggerMode: TooltipTriggerMode.tap,
            child: IconButton(
              onPressed: () => Dialogs.getFastResultHelp(context),
              icon: Icon(Icons.question_mark),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_back),
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
                style: TextStyle(fontSize: TextSizing.medium),
              ),
              GestureDetector(
                child: Icon(Icons.arrow_forward),
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
          SizedBox(height: 15),
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
              if (asyncSnapshot.connectionState == ConnectionState.waiting)
                return const CircularProgressIndicator();
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
          SizedBox(height: 15),
          StreamBuilder(
            stream: sms,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                debugPrint('SMS: waiting');
                return CircularProgressIndicator();
              }
              if (asyncSnapshot.hasError) {
                debugPrint('SMS: ${asyncSnapshot.error}');
                return CircularProgressIndicator();
              }
              if (!asyncSnapshot.hasData) {
                debugPrint('SMS: null');
                return CircularProgressIndicator();
              }
              StatisticsModel sm = asyncSnapshot.data!;
              debugPrint('SMS rebuild ${sm.getLength()}');
              return Column(
                children: [
                  Text(
                    'Total Hours Fasted in ${months[thisMonth]}: ${sm.getTotalForMonth(thisYear, thisMonth)}',
                    style: TextStyle(fontSize: TextSizing.medium),
                  ),
                  Text('Longest Fast: ${sm.getLongest().inMinutes}'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // FutureBuilder showStats(StatisticsModel sm) {
  //   Text makeAvg = Text('Total Hours Fasted in ${months[thisMonth]}: ${sm.getAverage()}',
  //           style: TextStyle(fontSize: TextSizing.medium),);
  // }

  // Future<StatisticsModel> getModel(UserSessionData session) async {
  //   //! change getDurations to fasts in range
  //   final curFasts = await ref.watch(fDaoProvider).getDurations(session.userId, session.fastingForm.name);
  //   return StatisticsModel(curFasts: curFasts, curForm: session.fastingForm);
  // }

  void changeFocus(int curYear, int curMonth, UserSessionData session) {
    setState(() {
      DateTime focusMonth = DateTime(curYear, curMonth + 1);
      start = DateTime(focusMonth.year, focusMonth.month, 1);
      end = DateTime(focusMonth.year, focusMonth.month + 1, 0);
      daysInMonth = end.day;
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
            style: TextStyle(color: Colors.black, fontSize: 20),
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
                style: TextStyle(color: Colors.black, fontSize: 20),
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
    List<String> strList = log.fastResult.split(',');
    List<Icon> frList = List.empty(growable: true);
    final converter = FastResultConverter();

    for (String res in strList) {
      frList.add(converter.fromSql(res).resultIcon);
    }
    return frList;
  }

  StreamBuilder getCalendar(UserSessionData session) {
    return StreamBuilder<List<FastLogData>>(
      // stream: ref
      //     .watch(fDaoProvider)
      //     .findFasts(
      //       1
      //     ),
      stream: ref
          .watch(fDaoProvider)
          .findFastsInRange(1, DateTimeRange(start: start, end: end)),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting)
          return const CircularProgressIndicator();
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
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
        );
      },
    );
  }
}
