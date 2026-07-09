import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/history_item.dart';

class FastingHistory extends StatefulWidget {
  const FastingHistory({super.key});

  @override
  State<FastingHistory> createState() => _FastingHistoryState();
}

const List<String> months = <String>['January', 'Feb', 'March', 'April', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
// const DoubleLinkedQueue monthss = Dou

class _FastingHistoryState extends State<FastingHistory> {
  final FastingDao fDao = getIt<FastingDao>();
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    int thisMonth = today.month - 1;
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
          onTap: () => {
            Navigator.of(context).pop()
            },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ? Consider using DateTimeRange here?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => {
            // TODO Previous month
            // thisMonth = thisMonth - 1 == 0 ? 12 : thisMonth--
          },
        ),
        Text(months[thisMonth], style: TextStyle(fontSize: TextSizing.medium),),
        GestureDetector(
          child: Icon(Icons.arrow_forward),
          onTap: () => {
            // TODO Subsequent month
            // thisMonth = thisMonth + 1 == 2 ? 1 : thisMonth++
          },
        )],),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 30,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  return HistoryItem(date: DateTime.now()).getDay();
                },
                // itemBuilder: (context, index) {
                //   return Padding(
                //     padding: const EdgeInsets.all(4.0),
                //     child: Container(
                //       color: Colors.green,
                //       child: Center(
                //         child: Text(
                //           "Builder: $index",
                //           style: TextStyle(color: Colors.white, fontSize: 30),
                //         ),
                //       ),
                //     ),
                //   );
                // },
              ),
            ),
          ),
            Text('Total Hours Fasted in :', style: TextStyle(fontSize: TextSizing.medium),),
        ],
      ),
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
