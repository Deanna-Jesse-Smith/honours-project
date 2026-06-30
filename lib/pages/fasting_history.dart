import 'package:flutter/material.dart';
import 'package:testrun/utils/text_sizing.dart';

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
        children: [
           GridView.count(
    crossAxisCount: 3, // 3 columns
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    children: List.generate(40, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(color: Colors.green),
      );
    }),
  ),
          // GridView.builder(
          //   itemCount: 30,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 6,
          //     mainAxisSpacing: 5,
          //     crossAxisSpacing: 6,
          //   ),
          //   itemBuilder: (context, index) {
          //     return Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(
          //         color: Colors.green,
          //         child: Center(
          //           child: Text(
          //             "Builder: $index",
          //             style: TextStyle(color: Colors.white, fontSize: 30),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
