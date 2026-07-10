import 'package:flutter/material.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/user_state.dart';

class HistoryItem {
  final DateTime date;
  final bool completedFastingGoal;

  HistoryItem({required this.date, this.completedFastingGoal = false});

  Padding getDay() {
    return .new(
      padding: EdgeInsets.all(4.0),
      child: Container(
        // height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            '${date.day}',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }

  // StreamBuilder<List> populateCalendar(BuildContext context) {
  //   DateTime today = DateTime.now();
  //   DateTime start = DateTime(today.year, today.month, 1);
  //   DateTime end = DateTime(today.year, today.month + 1, 0);
  //   int daysInMonth = end.day;

  //   Stream<List> test = getIt<FastingDao>().findFastsInRange(
  //     userState.userID,
  //     DateTimeRange(start: start, end: end),
  //   );

  //   return StreamBuilder<List>(
  //     stream: test,
  //     builder: (context, snapshot) {
  //       if (!snapshot.hasData) {
  //         return const Center(child: CircularProgressIndicator());
  //       }

  //       final dayByDay = <int, FastLogData>{
  //         for (FastLogData fast in snapshot.data!) fast.startDateTime.day: fast,
  //       };

  //       return GridView.builder(
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 7,
  //         ),
  //         itemBuilder: (context, index) {
  //           final log = dayByDay[index];

  //           return Padding(
  //             padding: EdgeInsets.all(4.0),
  //             child: Container(
  //               // height: 40,
  //               decoration: BoxDecoration(
  //                 border: Border.all(color: Colors.black, width: 2),
  //                 borderRadius: BorderRadius.circular(15),
  //               ),
  //               child: Center(
  //                 child: Text(
  //                   '${log!.startDateTime.day}',
  //                   style: TextStyle(color: Colors.black, fontSize: 30),
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
}
