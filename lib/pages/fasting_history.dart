import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/history_item.dart';

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
  Stream<FastLogData> data = Stream.empty();
  late DateTime start, end;

  @override
  void initState() {
    final session = ref.watch(userSessionProvider);

    DateTime focusMonth = DateTime(thisYear, thisMonth + 1);
    start = DateTime(focusMonth.year, focusMonth.month, 1);
    end = DateTime(focusMonth.year, focusMonth.month + 1, 0);
    daysInMonth = end.day;
    // firstWeekday = start.weekday % 7;
    firstWeekday = start.weekday - 1;
    totalCells = firstWeekday + daysInMonth;

    print("Year: $thisYear");
print("Month: $thisMonth");
print("Focus month: $focusMonth");
print("Start: $start");
print("End: $end");
print("Days: $daysInMonth");
print("First weekday: $firstWeekday");

    // data = ref.watch(fDaoProvider).findFastsInRange(session.userID, range)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // DateTime focusMonth = DateTime.now();
    // DateTime start = DateTime(focusMonth.year, focusMonth.month, 1);
    // DateTime end = DateTime(focusMonth.year, focusMonth.month + 1, 0);
    // int daysInMonth = end.day;

    // final firstWeekday = start.weekday % 7;
    // final totalCells = firstWeekday + daysInMonth;
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  // TODO Previous month from FastLog
                  setState(() {
                    // thisMonth = thisMonth - 1 == -1 ? 11 : thisMonth - 1;

                    if (thisMonth - 1 == -1) {
                      thisMonth = 11;
                      thisYear = thisYear - 1;
                    } else {
                      thisMonth = thisMonth - 1;
                    }
                    changeFocus(thisYear, thisMonth);
                  });
                },
              ),
              Text(
                months[thisMonth],
                style: TextStyle(fontSize: TextSizing.medium),
              ),
              GestureDetector(
                child: Icon(Icons.arrow_forward),
                onTap: () {
                  // TODO Subsequent month from FastLog
                  setState(() {
                    // thisMonth = thisMonth + 1 == 12 ? 0 : thisMonth + 1;

                    if (thisMonth + 1 == 12) {
                      thisMonth = 0;
                      thisYear = thisYear + 1;
                    } else {
                      thisMonth = thisMonth + 1;
                    }
                    changeFocus(thisYear, thisMonth);
                  });
                },
              ),
            ],
          ),
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
          Expanded(child: getCalendar()),
          Text(
            'Total Hours Fasted in : ${months[thisMonth]}',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ],
      ),
    );
  }

  // void goToPreviousMonth() {
  //   final newDate = DateTime(thisYear, thisMonth - 1, 1);
  //   changeFocus(newDate.year, newDate.month);
  // }

  // void goToNextMonth() {
  //   final newDate = DateTime(thisYear, thisMonth + 1, 1);
  //   changeFocus(newDate.year, newDate.month);
  // }

  void changeFocus(int curYear, int curMonth) {
    DateTime focusMonth = DateTime(curYear, curMonth + 1);
    start = DateTime(focusMonth.year, focusMonth.month, 1);
    end = DateTime(focusMonth.year, focusMonth.month + 1, 0);
    daysInMonth = end.day;
    // firstWeekday = start.weekday % 7;
    firstWeekday = start.weekday - 1;
    totalCells = firstWeekday + daysInMonth;
  }

  Padding emptyDay(DateTime day) {
    return .new(
      padding: EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Padding fastDay(DateTime day, Set<FastResult> log, FastingForm form) {
    return .new(
      padding: EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  GridView getCalendar() {
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
