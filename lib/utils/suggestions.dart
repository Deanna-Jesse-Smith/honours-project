import 'package:flutter/material.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/pages/fasting_history.dart';

class HydrationDefaults {
  final String gender;
  late double amount;

  HydrationDefaults(this.gender);

  double getDailyWater() {
    return 1.0; //! To be made into something to calculate the amount when I have time later
  }
}

class DayConstraints {
  final TimeOfDay earlyMeal, lateMeal;
  final Duration eatingWindow;

  DayConstraints(this.earlyMeal, this.lateMeal, this.eatingWindow);

  static DayConstraints extract(
    List<TimeOfDay> times, {
    Duration buffer = const Duration(minutes: 40),
  }) {
    final sort = [...times]
      ..sort(
        (a, b) => (a.hour * 60 + a.minute).compareTo(b.hour * 60 + b.minute),
      );
    final early = sort.first;
    final late = sort.last;

    final window = Duration(
      minutes:
          (late.hour * 60 + late.minute) - (early.hour * 60 + early.minute),
    );
    return DayConstraints(early, late, window + buffer * 2);
  }
}

class Suggest {
  final FastingForm form;
  final String reasoning;
  final List<List<TimeOfDay>>? trePlans;
  final List<List<int>>? dayPlans;

  Suggest.tre(this.trePlans, this.reasoning)
    : form = FastingForm.tre,
      dayPlans = null;

  Suggest.adf(this.dayPlans, this.reasoning)
    : form = FastingForm.adf,
      trePlans = null;

  Suggest.fiveTwo(this.dayPlans, this.reasoning)
    : form = FastingForm.fiveTwo,
      trePlans = null;
}

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

  /// Returns an ObligationSpan object that represents the span of time between the earliest and latest meal times, with an optional buffer added to the required window.
  /// 
  /// [mealTimes] is a list of TimeOfDay objects representing the user's meal times.
  /// [buffer] is an optional Duration object that specifies the amount of time to add to the required window. The default value is 30 minutes.
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

/// A class representing a fasting option along with its associated score.
class ScoredOption {
  final FastOption option;
  final int score;

  const ScoredOption(this.option, this.score);
}

/// A base class representing a fasting option with a label and justification.
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
    // exp = prevDuration > 4 ? Experience.experienced : Experience.beginner;

    restrainTRE = struggle.contains(Struggle.daily);
    restrainNonTRE = struggle.contains(Struggle.weekly);

    if (meals.times.isEmpty) {
      constraints = ObligationSpan.o(earliestNormalStart, latestNormalEnd);
    } else {
      constraints = ObligationSpan.extractSpan(meals.times);
    }
  }

  Experience getExp() => exp;

  /// Returns a score for the given fasting form based on the user's previous fasting forms, duration, struggles, and meal obligations.
  /// 
  /// [form] is an instance of [FastingForm] representing the fasting form to be scored.
  int scoreForm(FastingForm form) {
    var score = 0;

    if (prevForms.contains(form)) {
      score += 3;
    }

    if (form == FastingForm.tre) {
      if (exp == Experience.beginner) {
        score += 2;
      } else {
        score -= 1;
      }

      if (struggle.contains(Struggle.daily)) {
        score -= 4;
        if (struggle.contains(Struggle.weekly)) {
          score += 2;
        }
      }
    } else if (form == FastingForm.adf) {
      if (exp == Experience.beginner) {
        score -= 2;

        if (struggle.contains(Struggle.daily)) {
          score -= 2;
        }
      } else {
        score += 1;
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
        score += 1;
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

  /// Returns a list of the top 3 recommended fasting options based on the user's previous fasting forms, duration, struggles, and meal obligations.
  List<FastOption> getRecs() {
    List<ScoredOption> options = [];

    if (!restrainTRE || prevForms.contains(FastingForm.tre)) {
      options.addAll(
        treEvaluation(constraints, exp).map((option) => score(option)),
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

    options.sort((a, b) => b.score.compareTo(a.score));
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
    final minMinutes = exp == Experience.beginner ? 8 * 60 : 6 * 60;
    final earliestStart = toMinutes(span.earliest) - 30;
    final latestEnd = toMinutes(span.latest) + 30;
    final biggestLength = latestEnd - earliestStart;

    final length = biggestLength < minMinutes ? minMinutes : biggestLength;

    final dayEarliestMinutes = toMinutes(dayEarliest);
    final dayLatestMinutes = toMinutes(dayLatest);

    final options = <TREoption>[];

    final eartlyStart = earliestStart.clamp(
      dayEarliestMinutes,
      dayLatestMinutes - length,
    );
    final earlyEnd = eartlyStart + length;
    if (earlyEnd <= dayLatestMinutes) {
      options.add(
        TREoption(
          toTimeOfDay(eartlyStart),
          toTimeOfDay(earlyEnd),
          Duration(minutes: length),
          'Early TRE (${formatTime(toTimeOfDay(eartlyStart))}–${formatTime(toTimeOfDay(earlyEnd))})',
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
    if (lateStart >= dayEarliestMinutes && lateStart != eartlyStart) {
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

    if (length - biggestLength > 0) {
      final otherLength = length + 60;
      final otherStart = earliestStart.clamp(
        dayEarliestMinutes,
        dayLatestMinutes - otherLength,
      );
      final otherEnd = otherStart + otherLength;

      if (otherEnd <= dayLatestMinutes) {
        options.add(
          TREoption(
            toTimeOfDay(otherStart),
            toTimeOfDay(otherEnd),
            Duration(minutes: otherLength),
            'TRE (${formatTime(toTimeOfDay(otherStart))}–${formatTime(toTimeOfDay(otherEnd))})',
            'A more generous ${otherLength ~/ 60}-hour window if you\'d like extra flexibility beyond the minimum needed.',
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
    combinations.retainWhere((c) => c.isNotEmpty && c.length != 3);

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

class RecommendFast {
  final FastingForm form;
  late String? reasoning;
  late List<List<int>>? adfList, fiveTwoList;
  late List<List<TimeOfDay>> treList;
  final Experience exp;
  late ObligationMeals meals;
  final TimeOfDay earliestNormalStart = TimeOfDay(hour: 6, minute: 30),
      latestNormalEnd = TimeOfDay(hour: 21, minute: 0);

  RecommendFast(
    this.form,
    this.reasoning, {
    required this.adfList,
    required this.fiveTwoList,
    required this.treList,
    required this.exp,
  });

  RecommendFast.o(this.form, this.meals, this.exp);

  Suggestion makePlan() {
    late ObligationSpan constraints;
    if (meals.times.isEmpty) {
      constraints = ObligationSpan.o(earliestNormalStart, latestNormalEnd);
    } else {
      constraints = ObligationSpan.extractSpan(meals.times);
    }

    final considerations = treEvaluation(constraints, exp);
    fiveTwoEvaluation(meals, exp);
    if (exp == Experience.experienced) {
      adfEvaluation(meals, exp);
    }

    return considerations;
  }

  int toMinutes(TimeOfDay t) => t.hour * 60 + t.minute;

  TimeOfDay toTimeOfDay(int m) =>
      TimeOfDay(hour: (m ~/ 60) % 24, minute: m % 60);

  final dayEarliest = TimeOfDay(hour: 5, minute: 0),
      dayLatest = TimeOfDay(hour: 22, minute: 0);

  Suggestion treEvaluation(ObligationSpan span, Experience exp) {
    final minMinutes = exp == Experience.beginner ? 8 * 60 : 6 * 60;
    final earliestStart = toMinutes(span.earliest) - 30;
    final latestEnd = toMinutes(span.latest) + 30;
    final biggestLength = latestEnd - earliestStart;

    final length = biggestLength < minMinutes ? minMinutes : biggestLength;

    final dayEarliestMinutes = toMinutes(dayEarliest);
    final dayLatestMinutes = toMinutes(dayLatest);

    final options = <TREoption>[];

    final eartlyStart = earliestStart.clamp(
      dayEarliestMinutes,
      dayLatestMinutes - length,
    );
    final earlyEnd = eartlyStart + length;
    if (earlyEnd <= dayLatestMinutes) {
      options.add(
        TREoption(
          toTimeOfDay(eartlyStart),
          toTimeOfDay(earlyEnd),
          Duration(minutes: length),
          'Early TRE',
          'A ${length ~/ 60}-hour eating window, starting at ${toTimeOfDay(eartlyStart)}',
        ),
      );
    }

    final lateEnd = latestEnd.clamp(
      dayEarliestMinutes + length,
      dayLatestMinutes,
    );
    final lateStart = lateEnd - length;
    if (lateStart >= dayEarliestMinutes && lateStart != eartlyStart) {
      options.add(
        TREoption(
          toTimeOfDay(lateStart),
          toTimeOfDay(lateEnd),
          Duration(minutes: length),
          'Late TRE',
          'A ${length ~/ 60}-hour eating window, starting at ${toTimeOfDay(eartlyStart)}',
        ),
      );
    }

    if (length - biggestLength > 0) {
      final otherLength = length + 60;
      final otherStart = earliestStart.clamp(
        dayEarliestMinutes,
        dayLatestMinutes - otherLength,
      );
      final otherEnd = otherStart + otherLength;

      if (otherEnd <= dayLatestMinutes) {
        options.add(
          TREoption(
            toTimeOfDay(otherStart),
            toTimeOfDay(otherEnd),
            Duration(minutes: otherLength),
            'Other',
            'A more generous ${otherLength ~/ 60}-hour window if you\'d like extra flexibility beyond the minimum needed.',
          ),
        );
      }
    }

    return Suggestion.tre([], '');
  }

  Suggestion adfEvaluation(ObligationMeals meals, Experience exp) {
    final getAvailable = findAvailableDays(meals, true);

    List<List<int>> combinations = RecommendationSystem.validCombosHelper(
      getAvailable,
      true,
    );

    adfList = combinations;

    return Suggestion.adf(combinations, 'Experienced and timetable');
  }

  Suggestion fiveTwoEvaluation(ObligationMeals meals, Experience exp) {
    final getAvailable = findAvailableDays(meals, true);

    List<List<int>> pairs = RecommendationSystem.validCombosHelper(
      getAvailable,
      false,
    );

    String selectionDays =
        'It is then recommended you pick from the following combinations for your fasting days:';

    fiveTwoList = pairs;

    return Suggestion.fiveTwo(pairs, selectionDays);
  }

  List<int> findAvailableDays(ObligationMeals meals, bool isFiveTwo) {
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

  // List<List<int>> validCombosHelper(List<int> pool, bool isADF) {
  //   int cap = isADF ? 3 : 2;

  //   List<List<int>> validCombos(
  //     List<int> subpool,
  //     int initDay,
  //     List<List<int>> acc,
  //     List<int> cur,
  //   ) {
  //     if (subpool.isEmpty || cur.length >= cap) return [...acc, cur];
  //     List<List<int>> withDay = [], withoutDay = [];
  //     if (initDay + 1 < subpool.first) {
  //       withoutDay = validCombos(subpool.sublist(1), initDay, acc, cur);
  //       cur = [...cur, subpool.first];
  //       withDay = validCombos(subpool.sublist(1), subpool.first, acc, cur);
  //     } else {
  //       withoutDay = validCombos(subpool.sublist(1), initDay, acc, cur);
  //     }
  //     return [...withDay, ...withoutDay];
  //   }

  //   final combinations = validCombos(pool.sublist(1), pool.first, [], []);
  //   final output = combinations.where((combo) {
  //     // final set = combo.toSet();
  //     // return combo.every((c) => !set.contains((c + 1) % 7));
  //     // return !(combo.contains(0) && combo.contains(6));
  //     final hasZero = combo.contains(0);
  // final hasSix = combo.contains(6);
  // final valid = !(hasZero && hasSix);

  // debugPrint('$combo: hasZero=$hasZero, hasSix=$hasSix, valid=$valid');

  // return valid;
  //   }).toList();
  //   debugPrint('OUTPUT: $output');
  //   return output;
  // }

  List<int> makeCombo(int day, List<int> subpool) {
    if (subpool.isEmpty) return [day];

    if (subpool.first > day + 1) {
      final temp = makeCombo(subpool.first, subpool.sublist(1));
      temp.add(day);
      return temp;
    } else {
      return makeCombo(day, subpool.sublist(1));
    }
  }

  List<List<int>> combos(int cap, List<int> pool) {
    if (pool.isEmpty) return [];
    final first = pool.first;
    final rest = pool.sublist(first);
    final withWrap = combos(cap - 1, rest).map((c) => [first, ...c]).toList();
    final noWrap = combos(cap, rest);
    return [...withWrap, ...noWrap];
  }
}
