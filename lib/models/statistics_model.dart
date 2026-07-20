// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/pages/fasting_history.dart';

class StatisticsModel {
  late List<FastLogData> curFasts, treFasts, adfFasts, fiveTwoFasts;
  late List<Duration> curTREDurations, curADFDurations;
  FastingForm curForm;
  //? Have something specific for 5:2 fasts

  StatisticsModel({required this.curFasts, required this.curForm}) {
    FastingFormConverter ffc = FastingFormConverter();
    debugPrint('SM: start ${curFasts.length}');
    for (FastLogData fast in curFasts) {
      debugPrint(fast.toString());
    }
    treFasts = curFasts.where((f) => ffc.fromSql(f.formIF) == FastingForm.tre).toList();
    debugPrint('SM: tre ${treFasts.length}');
    curTREDurations = treFasts.map((f) => f.duration as Duration).toList();
    debugPrint('SM: tred');
    adfFasts = curFasts.where((f) => f.formIF == FastingForm.adf.name).toList();
    debugPrint('SM: adf');
    curADFDurations = adfFasts.map((f) => f.duration as Duration).toList();
    debugPrint('SM: adfd');
    fiveTwoFasts = curFasts.where((f) => f.formIF == FastingForm.fiveTwo.name).toList();
    debugPrint('SM: 52');
    //* the something else
  }

  Duration getLength() {
    Duration longest = Duration(hours: 0, minutes: 0);

    for (FastLogData fast in treFasts) {
      longest = fast.duration?.compareTo(longest) == 1 ? fast.duration! : longest;
    }
    
    return longest;
  }

  double getAverage() {
    debugPrint('TRE lengths: ${curTREDurations.length}');
    debugPrint('Number of TRE: ${treFasts.length}');
    debugPrint('Overall fasts: ${curFasts.length}');
    if (curTREDurations.isNotEmpty) {
      return curTREDurations.map((d) => d.inMinutes).reduce((a, b) => a + b) /
        curTREDurations.length /
        60;
    }
    return 0;
  }

  double getTotalForMonth(int year, int month) {
    if (curFasts.isEmpty) {
      return 0;
    }
    final thisDurations = curFasts
        .map((d) => d.duration as Duration)
        .fold(0, (prev, cur)  {
          debugPrint('SM: Prev: $prev and cur: $cur');
          return prev + cur.inMinutes;
        });
    // final thisDurations = curFasts.where((f) => f.formIF == curForm.name && f.startDateTime.year == year && f.startDateTime.month == month).map((d) => d.duration as Duration).fold(0, (prev, cur) => prev + cur.inMinutes);
    return thisDurations / 60;
  }

  Duration getLongest() {
    if (curTREDurations.isEmpty) return Duration();
    return curTREDurations.reduce((a, b) => a > b ? a : b);
  }
}
