// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';

class StatisticsModel {
  late List<FastLogData> curFasts, treFasts, adfFasts, fiveTwoFasts;
  late List<Duration> curTREDurations, curADFDurations, timedDurations;
  FastingForm curForm;

  StatisticsModel({
    required List<FastLogData> curFasts,
    required this.curForm,
  }) {
    this.curFasts = oneFastPerDay(curFasts);
    treFasts = this.curFasts.where((f) => f.formIF == FastingForm.tre).toList();
    curTREDurations = treFasts.map((f) => f.duration as Duration).toList();
    adfFasts = this.curFasts.where((f) => f.formIF == FastingForm.adf).toList();
    curADFDurations = adfFasts.map((f) => f.duration as Duration).toList();
    timedDurations = this.curFasts
        .where((f) => f.formIF != FastingForm.fiveTwo)
        .map((f) => f.duration as Duration)
        .toList();
    fiveTwoFasts = this.curFasts
        .where((f) => f.formIF == FastingForm.fiveTwo)
        .toList();
  }

/// Returns a list of unique fasts, ensuring that only one fast per day is included. If multiple fasts occur on the same day, only the first one is retained.
  List<FastLogData> oneFastPerDay(List<FastLogData> fasts) {
    final fastsByDay = <DateTime, FastLogData>{};

    for (final fast in fasts) {
      final start = fast.startDateTime;
      final day = DateTime(start.year, start.month, start.day);
      fastsByDay.putIfAbsent(day, () => fast);
    }

    return fastsByDay.values.toList();
  }

  Duration getLength() {
    Duration longest = Duration(hours: 0, minutes: 0);

    for (FastLogData fast in curFasts) {
      longest = fast.duration?.compareTo(longest) == 1
          ? fast.duration!
          : longest;
    }

    return longest;
  }

  String? getAverage() {
    if (timedDurations.isEmpty) return null;

    final total = timedDurations.fold(Duration.zero, (prev, cur) => prev + cur);

    return formatDuration(total ~/ timedDurations.length);
  }

  String getTotalForMonth() {
    if (curFasts.isEmpty) {
      return formatDuration(Duration.zero);
    }
    final thisDurations = curFasts
        .map((d) => d.duration as Duration)
        .fold(Duration.zero, (prev, cur) => prev + cur);
    return formatDuration(thisDurations);
  }

  String? getLongestTimed() {
    // if (curTREDurations.isEmpty) return Duration.zero;
    // return curTREDurations.reduce((a, b) => a > b ? a : b);

    if (timedDurations.isEmpty) return null;

    return formatDuration(
      timedDurations.reduce((longest, cur) => cur > longest ? cur : longest),
    );
  }

  String getAsPlannedRate() {
    double rate = curFasts.isEmpty
        ? 0
        : (curFasts.fold<num>(
                0,
                (prev, f) =>
                    prev +
                    (f.asPlanned
                        ? 1
                        : f.halfAsPlanned
                        ? 0.5
                        : 0),
              )) /
              curFasts.length;
    return formatPercentage(rate);
  }

  //! For below: - is early, + is late overall
  double curStartDeviation() => curFasts.averageStartDeviation;
  double curEndDeviation() => curFasts.averageEndDeviation;

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

  int getNumFasts() {
    return curFasts.length;
  }

  String formatDuration(Duration? duration) {
    if (duration == null) return '—';

    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    if (hours == 0) {
      return '$minutes min';
    }

    if (minutes == 0) {
      return '$hours h';
    }

    return '$hours h $minutes min';
  }

  String formatPercentage(double value) {
    return '${(value * 100).round().clamp(0, 100)}%';
  }

  int numCompleted() => curFasts.where((f) => f.endDateTime != null).length;

  int onTimeStartCount() => curFasts.plannedStartCount;

  int onTimeEndCount() => curFasts.plannedEndCount;
}
