// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';

class StatisticsModel {
  List<FastLogData> curFasts;
  late List<Duration> curDurations;
  FastingForm curForm;

  StatisticsModel({
    required this.curFasts,
    required this.curForm,
  }) {
    curDurations = curFasts.where((f) => f.formIF == curForm.name).map((e) => e.duration as Duration).toList();
  }

 int getLength() {
  return curFasts.where((f) => f.formIF == curForm.name).length;
 }
  
  double getAverage() {
    return curDurations.map((d) => d.inMinutes).reduce((a, b) => a + b) / getLength() / 60;
  }

  int getTotalForMonth(int year, int month) {
        final thisDurations = curFasts.where((f) => f.formIF == curForm.name).map((d) => d.duration as Duration).fold(0, (prev, cur) => prev + cur.inMinutes);
    // final thisDurations = curFasts.where((f) => f.formIF == curForm.name && f.startDateTime.year == year && f.startDateTime.month == month).map((d) => d.duration as Duration).fold(0, (prev, cur) => prev + cur.inMinutes);
    return thisDurations;
  }

  Duration getLongest() {
    return curDurations.reduce((a, b) => a > b ? a : b);
  }
}
