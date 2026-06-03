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
        onTap: () => {
          Navigator.of(context).pop()
        }
      ),
    ),
    );
  }
}