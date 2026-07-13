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

const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

class _FastingHistoryState extends ConsumerState<FastingHistory> {
  int thisMonth = DateTime.now().month - 1;
  Stream<FastLogData> data = Stream.empty();

  @override
  void initState() {
    //! Think about moving the start/end variables here so that they can get initialized once. 
    //! Maybe make a method to recalculate them each time the user looks at a different month
    final session = ref.watch(userSessionProvider);
    // data = ref.watch(fDaoProvider).findFastsInRange(session.userID, range)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime start = DateTime(today.year, today.month, 1);
    DateTime end = DateTime(today.year, today.month + 1, 0);
    int daysInMonth = end.day;
    
    final firstWeekday = start.weekday % 7; // adjust for your week-start convention
    final totalCells = firstWeekday + daysInMonth;
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
                    thisMonth = thisMonth - 1 == -1 ? 11 : thisMonth - 1;
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
                    thisMonth = thisMonth + 1 == 12 ? 0 : thisMonth + 1;
                  });
                },
              ),
            ],
          ),
          Row(
            children: daysOfWeek.map(
              (day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ).toList(),
          ),
          // StreamBuilder(
          //   stream: stream,
          //   builder: (context, asyncSnapshot) {
          //     return GridView.builder(  //? FutureBuilder, depending
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
          //       itemCount: totalCells,
          //       itemBuilder: (context, index) {
          //         if (index < firstWeekday) {
          //           return const SizedBox.shrink();
          //         }
          //         final day = index - firstWeekday + 1;
          //         final log = dayByDay[day];
              
          //         if (log == null) {
          //           return emptyDay(day: day);
          //         }
          //         return fastDay(day: day, log: log);
          //       },
          //     );
          //   }
          // ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: GridView.builder(
          //       itemCount: 30,
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 7,
          //         mainAxisSpacing: 5,
          //         crossAxisSpacing: 3,
          //       ),
          //       itemBuilder: (context, index) {
          //         return HistoryItem(date: DateTime.now()).getDay();
          //       },
          //       // itemBuilder: (context, index) {
          //       //   return Padding(
          //       //     padding: const EdgeInsets.all(4.0),
          //       //     child: Container(
          //       //       color: Colors.green,
          //       //       child: Center(
          //       //         child: Text(
          //       //           "Builder: $index",
          //       //           style: TextStyle(color: Colors.white, fontSize: 30),
          //       //         ),
          //       //       ),
          //       //     ),
          //       //   );
          //       // },
          //     ),
          //   ),
          // ),
          Text(
            'Total Hours Fasted in :',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ],
      ),
    );
  }

  Padding emptyDay(DateTime day) {
    return .new(padding: EdgeInsets.all(8),
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
    )
    );
  }

  Padding fastDay(DateTime day, Set<FastResult> log, FastingForm form) {
        return .new(padding: EdgeInsets.all(8),
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
    )
    );
  }

  // StreamBuilder<List> populateCalendar(BuildContext context) {
  //   DateTime today = DateTime.now();
  //   DateTime start = DateTime(today.year, today.month, 1);
  //   DateTime end = DateTime(today.year, today.month + 1, 0);
  //   int daysInMonth = end.day;

  //   Stream<List> test = fDao.findFastsInRange(userState.userID, DateTimeRange(start: start, end: end));

  //   StreamBuilder<List> make = StreamBuilder<List>(stream: test, builder: (context, snapshot) {
  //     if (!snapshot.hasData) {
  //       return const Center(child: CircularProgressIndicator());
  //     }

  //     final dayByDay = <int, FastLogData>{
  //       for(FastLogData fast in snapshot.data!) fast.startDateTime.day: fast,
  //     };

  //   });
  // }
}
