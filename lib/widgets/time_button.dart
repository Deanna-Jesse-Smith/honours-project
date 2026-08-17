import 'package:flutter/material.dart';

class TimeButton extends StatelessWidget {
  TimeOfDay curTime;
  final ValueChanged<TimeOfDay> onChange;

  TimeButton({super.key, required this.onChange, required this.curTime});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => onChange(curTime), child: Text(curTime.format(context)));
  }
}