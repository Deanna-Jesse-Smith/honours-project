import 'package:flutter/material.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/pages/fasting_history.dart';

class Suggestion {
  static List<List<int>> adfList = [], fiveTwoList = [];
  static late List<List<TimeOfDay>> treList;
  final String suggestions;

  final bool isTRE, isFiveTwo, isADF;

  Suggestion.tre(
    List<List<TimeOfDay>> treListt,
    this.suggestions, {
    this.isTRE = true,
    this.isADF = false,
    this.isFiveTwo = false,
  }) {
    treList = treListt;
  }

  Suggestion.adf(
    List<List<int>> adfListt,
    this.suggestions, {
    this.isTRE = false,
    this.isADF = true,
    this.isFiveTwo = false,
  }) {
    adfList = adfListt;
  }

  Suggestion.fiveTwo(
    List<List<int>> fiveTwoListt,
    this.suggestions, {
    this.isTRE = false,
    this.isADF = false,
    this.isFiveTwo = true,
  }) {
    fiveTwoList = fiveTwoListt;
  }
}

enum Experience { beginner, experienced }

class ObligationMeals {
  final List<int> days;
  final List<TimeOfDay> times;

  ObligationMeals(this.days, this.times);
}

class ObligationSpan {
  final TimeOfDay earliest;
  final TimeOfDay latest;
  late Duration requiredWindow;
  ObligationSpan(this.earliest, this.latest, this.requiredWindow);

  ObligationSpan.o(this.earliest, this.latest);

  static ObligationSpan extractSpan(
    List<TimeOfDay> mealTimes, {
    Duration buffer = const Duration(minutes: 30),
  }) {
    final sorted = [...mealTimes]
      ..sort(
        (a, b) => (a.hour * 60 + a.minute).compareTo(b.hour * 60 + b.minute),
      );
    final earliest = sorted.first;
    final latest = sorted.last;
    final span = Duration(
      minutes:
          (latest.hour * 60 + latest.minute) -
          (earliest.hour * 60 + earliest.minute),
    );
    return ObligationSpan(earliest, latest, span + buffer * 2);
  }
}

class ScoredOption {
  final FastOption option;
  final int score;

  const ScoredOption(this.option, this.score);
}

base class FastOption {
  final String label, justification;

  FastOption(this.label, this.justification);
}

final class TREoption extends FastOption {
  final TimeOfDay start, end;
  final Duration length;

  TREoption(
    this.start,
    this.end,
    this.length,
    super.label,
    super.justification,
  );
}

final class ADFoption extends FastOption {
  final List<int> days;

  ADFoption(this.days, super.label, super.justification);
}

final class ModifiedOption extends FastOption {
  final List<int> days;

  ModifiedOption(this.days, super.label, super.justification);
}

enum Struggle { weekly, daily }

class RecommendationSystem {
  final Set<FastingForm> prevForms;
  final int prevDuration;
  final Set<Struggle> struggle;
  final TimeOfDay earliestNormalStart = TimeOfDay(hour: 6, minute: 30),
      latestNormalEnd = TimeOfDay(hour: 21, minute: 0);
  final ObligationMeals meals;
  late ObligationSpan constraints;
  late Experience exp = Experience.beginner;

  late bool restrainNonTRE = false, restrainTRE = false;

  RecommendationSystem({
    required this.prevForms,
    required this.prevDuration,
    required this.struggle,
    required this.meals,
    this.exp = Experience.beginner,
  }) {

    restrainTRE = struggle.contains(Struggle.daily);
    restrainNonTRE = struggle.contains(Struggle.weekly);

    if (meals.times.isEmpty) {
      constraints = ObligationSpan.o(earliestNormalStart, latestNormalEnd);
    } else {
      constraints = ObligationSpan.extractSpan(meals.times);
    }
  }

  Experience getExp() => exp;

  int scoreForm(FastingForm form) {
    var score = 0;

    if (prevForms.contains(form)) {
      score += 3;
    }

    if (form == FastingForm.tre) {
      if (exp == Experience.beginner) {
        score += 2;
      }

      if (struggle.contains(Struggle.daily)) {
        score -= 4;
        if (struggle.contains(Struggle.weekly)) {
          score += 2;
        }
      }
    } else if (form == FastingForm.adf) {
      if (exp == Experience.beginner) {
        score -= 3;

        if (struggle.contains(Struggle.daily)) {
          score -= 2;
        }
      } else {
        if (struggle.contains(Struggle.daily)) {
          score += 2;
        }
      }

      if (struggle.contains(Struggle.weekly)) {
        score -= 4;
      }
    } else if (form == FastingForm.fiveTwo) {
      if (exp == Experience.beginner) {
        score -= 2;

        if (struggle.contains(Struggle.daily)) {
          score += 2;
        }
      } else {
        if (struggle.contains(Struggle.daily)) {
          score += 2;
        }
      }
    }

    return score;
  }

  ScoredOption score(FastOption option) {
    late FastingForm form;
    if (option is TREoption) {
      form = FastingForm.tre;
    } else if (option is ADFoption) {
      form = FastingForm.adf;
    } else {
      form = FastingForm.fiveTwo;
    }
    return ScoredOption(option, scoreForm(form));
  }

  List<FastOption> getRecs() {
    List<ScoredOption> options = [];

    if (!restrainTRE || prevForms.contains(FastingForm.tre)) {
      final treConstraints = meals.times.isEmpty
          ? ObligationSpan.o(earliestNormalStart, earliestNormalStart)
          : constraints;
      options.addAll(
        treEvaluation(treConstraints, exp).map((option) => score(option)),
      );
    }

    if (!restrainNonTRE || prevForms.contains(FastingForm.adf)) {
      options.addAll(adfEvaluation(meals, exp).map((option) => score(option)));
    }

    if (!restrainNonTRE || prevForms.contains(FastingForm.fiveTwo)) {
      options.addAll(
        fiveTwoEvaluation(meals, exp).map((option) => score(option)),
      );
    }

    options.sort((a, b) {
      final aPriorTRE =
        prevForms.contains(FastingForm.tre) && a.option is TREoption;
      final bPriorTRE =
        prevForms.contains(FastingForm.tre) && b.option is TREoption;
      if (aPriorTRE != bPriorTRE) return aPriorTRE ? -1 : 1;
      final scoreComparison = b.score.compareTo(a.score);
      if (scoreComparison != 0) return scoreComparison;
      if (a.option is ADFoption && b.option is ADFoption) {
        final aFastingDays = (a.option as ADFoption).days.length;
        final bFastingDays = (b.option as ADFoption).days.length;
        return bFastingDays.compareTo(aFastingDays);
      }
      if (a.option is TREoption && b.option is TREoption) {
        final aLength = (a.option as TREoption).length.inMinutes;
        final bLength = (b.option as TREoption).length.inMinutes;
        final aPreferred = aLength >= 8 * 60 && aLength <= 10 * 60;
        final bPreferred = bLength >= 8 * 60 && bLength <= 10 * 60;
        if (aPreferred != bPreferred) return aPreferred ? -1 : 1;
        return (aLength - 9 * 60).abs().compareTo((bLength - 9 * 60).abs());
      }

      return 0;
    });
    return options.take(3).map((o) => o.option).toList();
  }

  int toMinutes(TimeOfDay t) => t.hour * 60 + t.minute;

  TimeOfDay toTimeOfDay(int m) =>
      TimeOfDay(hour: (m ~/ 60) % 24, minute: m % 60);

  final dayEarliest = TimeOfDay(hour: 7, minute: 0),
      dayLatest = TimeOfDay(hour: 23, minute: 30);

  String formatTime(TimeOfDay time) =>
      '${time.hour.toString().padLeft(2, '0')}:'
      '${time.minute.toString().padLeft(2, '0')}';

  /// Returns all valid TRE options for the given obligation span and experience level.
  /// 
  /// [span] is an instance of [ObligationSpan] containing the earliest and latest meal times for the user.
  /// [exp] is an instance of [Experience] indicating whether the user is a beginner or not
  List<TREoption> treEvaluation(ObligationSpan span, Experience exp) {
    const absoluteMinMinutes = 4 * 60;
    const absoluteMaxMinutes = 12 * 60;
    const preferredMinMinutes = 8 * 60;
    const preferredMaxMinutes = 10 * 60;
    final earliestStart = toMinutes(span.earliest) - 30;
    final latestEnd = toMinutes(span.latest) + 30;
    final biggestLength = latestEnd - earliestStart;

    final requiredLength = biggestLength
        .clamp(absoluteMinMinutes, absoluteMaxMinutes)
        .toInt();
    final lengths = <int>[];
    if (requiredLength >= preferredMinMinutes &&
        requiredLength <= preferredMaxMinutes) {
      lengths.add(requiredLength);
    }
    for (final preferredLength in [8 * 60, 9 * 60, 10 * 60]) {
      if (preferredLength >= requiredLength &&
          !lengths.contains(preferredLength)) {
        lengths.add(preferredLength);
      }
    }
    if (!lengths.contains(requiredLength)) lengths.add(requiredLength);
    for (final fallbackLength in [11 * 60, 12 * 60]) {
      if (fallbackLength >= requiredLength) lengths.add(fallbackLength);
    }

    final dayEarliestMinutes = toMinutes(dayEarliest);
    final dayLatestMinutes = toMinutes(dayLatest);

    final options = <TREoption>[];

    for (final length in lengths) {
      final earlyStart = earliestStart.clamp(
        dayEarliestMinutes,
        dayLatestMinutes - length,
      );
      final earlyEnd = earlyStart + length;
      if (earlyEnd <= dayLatestMinutes) {
        options.add(
          TREoption(
            toTimeOfDay(earlyStart),
            toTimeOfDay(earlyEnd),
            Duration(minutes: length),
            'Early TRE (${formatTime(toTimeOfDay(earlyStart))}–${formatTime(toTimeOfDay(earlyEnd))})',
            'A ${length ~/ 60}-hour eating window, giving you extra time afterwards in case you run late.',
          ),
        );
      }

      final lateEnd = latestEnd.clamp(
        [dayEarliestMinutes + length, toMinutes(const TimeOfDay(hour: 21, minute: 0))]
            .reduce((a, b) => a > b ? a : b),
        dayLatestMinutes,
      );
      final lateStart = lateEnd - length;
      if (lateStart >= dayEarliestMinutes && lateStart != earlyStart) {
        options.add(
          TREoption(
            toTimeOfDay(lateStart),
            toTimeOfDay(lateEnd),
            Duration(minutes: length),
            'Late TRE (${formatTime(toTimeOfDay(lateStart))}–${formatTime(toTimeOfDay(lateEnd))})',
            'A ${length ~/ 60}-hour eating window, giving you extra time before your first meal.',
          ),
        );
      }
    }
    return options;
  }

  /// Returns all valid combinations of days for ADF fasting, given the user's meal obligations and experience level.
  /// 
  /// [meals] is an instance of [ObligationMeals] containing the days and times of the user's meals.
  /// [exp] is an instance of [Experience] indicating whether the user is a beginner or not
  List<ADFoption> adfEvaluation(ObligationMeals meals, Experience exp) {
    final getAvailable = findAvailableDays(meals, false);

    List<List<int>> combinations = validCombosHelper(getAvailable, true);
    combinations.retainWhere((c) => c.isNotEmpty && c.length <= 3);

    List<ADFoption> options = [];

    for (final combo in combinations) {
      options.add(
        ADFoption(
          combo,
          'ADF: A ${combo.length} day option',
          adfCombo(combo.sublist(1), 'A fast on ${daysOfWeek[combo.first]}'),
        ),
      );
    }

    return options;
  }

  /// Returns a string representation of the given combination of days, formatted as "A fast on [day1], [day2], and [day3]".
  /// 
  /// [combo] is a list of integers representing the days of the week (0 for Sunday, 1 for Monday, ..., 6 for Saturday).
  /// [acc] is an accumulator string that is used to build the final output.
  String adfCombo(List<int> combo, String acc) {
    if (combo.isEmpty) return acc;
    if (combo.length == 1) return '$acc and ${daysOfWeek[combo.first]}';
    return adfCombo(combo.sublist(1), '$acc, ${daysOfWeek[combo.first]}');
  }

  /// Returns all valid combinations of days from the given pool, with a maximum of 2 or 3 days depending on whether it's ADF or 5:2 fasting.
  /// 
  /// [meals] is an instance of [ObligationMeals] containing the days and times of the user's meals.
  /// [exp] is an instance of [Experience] indicating whether the user is a beginner or not
  List<ModifiedOption> fiveTwoEvaluation(
    ObligationMeals meals,
    Experience exp,
  ) {
    final getAvailable = findAvailableDays(meals, true);

    List<List<int>> pairs = validCombosHelper(getAvailable, false);
    pairs.retainWhere((c) => c.isNotEmpty && c.length == 2);

    List<ModifiedOption> options = [];

    for (final pair in pairs) {
      options.add(
        ModifiedOption(
          pair,
          '5:2',
          'A schedule with your calorie restriction days on ${daysOfWeek[pair.first]} and ${daysOfWeek[pair.last]}',
        ),
      );
    }

    return options;
  }

  /// Returns all days of the week that are available for fasting, given the user's meal obligations and whether they are doing ADF or 5:2 fasting.
  /// 
  /// [meals] is an instance of [ObligationMeals] containing the days and times of the user's meals.
  /// [isFiveTwo] is a boolean indicating whether the fasting type is 5:2 (true) or ADF (false).
  static List<int> findAvailableDays(ObligationMeals meals, bool isFiveTwo) {
    // I know the comments look suspicious but I promise I was using these to keep my thoughts in order when I was writing this method
    // ADF: At most three days, so aim for two or three
    // 5:2 Obviously just two

    // We want to check how many days of the week are available to fast freely which are NOT CONSECUTIVE
    // Returns days available for ADF or 5:2 fasting
    final days = meals.days;
    int times = meals.times.length;

    List<int> fullWeek = List.generate(7, (int index) => index);
    if (isFiveTwo && times <= 1) {
      // One meal on a 5:2 fasting day is okay—this can be the user's only meal of the day
      return fullWeek;
    } else if (days.length < 2) {
      // All but zero or one days available, no more computation needed
      return [...fullWeek]..retainWhere(
        (d) => !days.contains(d),
      ); // Retain only the items of fullWeek which are not in days
    } else if (days.length == 7) {
      return [];
    }

    final availability = [...fullWeek]..retainWhere((d) => !days.contains(d));
    List<int> availableDays = [];
    // e.g. 0,2,4,5,6 are availible

    for (int loop = 0; loop < availability.length - 1; loop++) {
      if (availability[loop + 1] > availability[loop] + 1) {
        // e.g. 2 > 1 then 4 > 3 then 5 !> 5
        availableDays.add(availability[loop]);
      }
    }
    availableDays.sort();
    return availableDays;
  }

  /// Returns all valid combinations of days from the given pool, with a maximum of 2 or 3 days depending on whether it's ADF or 5:2 fasting.
  /// 
  /// [pool] is a list of integers representing the days of the week (0 for Sunday, 1 for Monday, ..., 6 for Saturday).
  /// [isADF] is a boolean indicating whether the fasting type is ADF (true) or 5:2 (false).
  static List<List<int>> validCombosHelper(List<int> pool, bool isADF) {
    if (pool.isEmpty) return [];
    int cap = isADF ? 3 : 2;

    List<List<int>> validCombos(
      List<int> subpool,
      int? initDay,
      List<List<int>> acc,
      List<int> cur,
    ) {
      if (subpool.isEmpty || cur.length >= cap) {
        return [...acc, cur];
      }
      List<List<int>> withDay = [], withoutDay = [];
      if (initDay == null || initDay + 1 < subpool.first) {
        withoutDay = validCombos(subpool.sublist(1), initDay, acc, cur);
        cur = [...cur, subpool.first];
        withDay = validCombos(subpool.sublist(1), subpool.first, acc, cur);
      } else {
        withoutDay = validCombos(subpool.sublist(1), initDay, acc, cur);
      }
      return [...withDay, ...withoutDay];
    }

    final combinations = validCombos(pool, null, [], []);

    final output = combinations.where((combo) {
      // final set = combo.toSet();
      // return combo.every((c) => !set.contains((c + 1) % 7));
      return !(combo.contains(0) && combo.contains(6));
    }).toList();
    return output;
  }
}
