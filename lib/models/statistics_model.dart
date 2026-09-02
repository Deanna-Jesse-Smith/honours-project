// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';

class StatisticsModel {
  late List<FastLogData> curFasts, treFasts, adfFasts, fiveTwoFasts;
  late List<Duration> curTREDurations, curADFDurations;
  FastingForm curForm;

  StatisticsModel({required this.curFasts, required this.curForm}) {
    treFasts = curFasts.where((f) => f.formIF == FastingForm.tre).toList();
    curTREDurations = treFasts.map((f) => f.duration as Duration).toList();
    adfFasts = curFasts.where((f) => f.formIF == FastingForm.adf).toList();
    curADFDurations = adfFasts.map((f) => f.duration as Duration).toList();
    fiveTwoFasts = curFasts
        .where((f) => f.formIF == FastingForm.fiveTwo)
        .toList();
  }

  Duration getLength() {
    Duration longest = Duration(hours: 0, minutes: 0);

    for (FastLogData fast in treFasts) {
      longest = fast.duration?.compareTo(longest) == 1
          ? fast.duration!
          : longest;
    }

    return longest;
  }

  double getAverage() {
    if (curTREDurations.isNotEmpty) {
      return curTREDurations.map((d) => d.inMinutes).reduce((a, b) => a + b) /
          curTREDurations.length /
          60;
    }
    return 0;
  }

  int getTotalForMonth(int year, int month) {
    if (curFasts.isEmpty) {
      return 0;
    }
    final thisDurations = curFasts
        .map((d) => d.duration as Duration)
        .fold(Duration.zero, (prev, cur) => prev + cur);
    return thisDurations.inHours;
  }

  Duration getLongest() {
    if (curTREDurations.isEmpty) return Duration();
    return curTREDurations.reduce((a, b) => a > b ? a : b);
  }

  double getAsPlannedRate() => curFasts.plannedRate;

  //! For below: - is early, + is late overall
  int curStartDeviation() => curFasts.lateStartCount - curFasts.earlyStartCount;
  int curEndDeviation() => curFasts.lateEndCount - curFasts.earlyEndCount;

  // double getAverageStartDeviation() {

  // }

  int longestPlannedStreak() {
    int current = 0;
    int longest = 0;

    for (final fast in curFasts) {
      if (fast.asPlanned) {
        current++;
        if (current > longest) longest = current;
      } else {
        current = 0;
      }
    }

    return longest;
  }
}
