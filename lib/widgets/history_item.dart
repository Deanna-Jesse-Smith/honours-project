import 'package:flutter/material.dart';

class HistoryItem {
  final DateTime date;
  final bool completedFastingGoal;

  HistoryItem({required this.date, this.completedFastingGoal = false});
  
  Padding getDay() {
    return .new(
      padding: EdgeInsets.all(4.0),
      child: Container(
        // height: 40,
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text('${date.day}',
          style: TextStyle(color: Colors.black, fontSize: 30),
          )
        )
      )
      );
  }
}