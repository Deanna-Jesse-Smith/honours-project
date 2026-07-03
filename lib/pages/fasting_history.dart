import 'package:flutter/material.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/history_item.dart';

class FastingHistory extends StatefulWidget {
  const FastingHistory({super.key});

  @override
  State<FastingHistory> createState() => _FastingHistoryState();
}

class _FastingHistoryState extends State<FastingHistory> {
  @override
  Widget build(BuildContext context) {
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
          onTap: () => {
            // TODO Previous month
          },
        ),
        Text('Temp', style: TextStyle(fontSize: TextSizing.medium),),
        GestureDetector(
          child: Icon(Icons.arrow_forward),
          onTap: () => {
            // TODO Subsequent month
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
}
