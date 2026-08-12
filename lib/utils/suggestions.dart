import 'package:flutter/material.dart';
import 'package:testrun/models/converters.dart';

class HydrationDefaults {
  final String gender;
  late double amount;

  HydrationDefaults(this.gender);

  double getDailyWater() {
    return 1.0; //! To be made into something to calculate the amount when I have time later
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
  final Duration requiredWindow;
  ObligationSpan(this.earliest, this.latest, this.requiredWindow);

  static ObligationSpan extractSpan(List<TimeOfDay> mealTimes, {Duration buffer = const Duration(minutes: 30)}) {
  final sorted = [...mealTimes]..sort((a, b) => (a.hour * 60 + a.minute).compareTo(b.hour * 60 + b.minute));
  final earliest = sorted.first;
  final latest = sorted.last;
  final span = Duration(minutes: (latest.hour * 60 + latest.minute) - (earliest.hour * 60 + earliest.minute));
  return ObligationSpan(earliest, latest, span + buffer * 2);
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

class TREoption {
  final TimeOfDay start, end;
  final Duration length;
  final String label, justification;

  TREoption(this.start, this.end, this.length, this.label, this.justification);
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

// extension ChoiceInfo on List<Suggestion> {
//   List<List<TimeOfDay>> get findTRE => where((s) => s.isTRE).first.treList;

//   Iterator<List<int>> get findADF => where((s) => s.isADF).first.adfList.iterator;

//   Iterator<List<int>> get findFiveTwo => where((s) => s.isFiveTwo).first.fiveTwoList.iterator;
// }

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
    final constraints = ObligationSpan(earliest, latest, requiredWindow);
    final considerations = treEvaluation(constraints, exp);
    fiveTwoEvaluation(meals, exp);
    if (exp == Experience.experienced) {
      adfEvaluation(meals, exp);
    }

    return considerations;
  }

  int toMinutes(TimeOfDay t) => t.hour * 60 + t.minute;

  TimeOfDay toTimeOfDay(int m) => TimeOfDay(hour: (m ~/ 60) % 24, minute: m % 60);

  final dayEarliest = TimeOfDay(hour: 5, minute: 0), dayLatest = TimeOfDay(hour: 22, minute: 0);

  Suggestion treEvaluation(ObligationSpan span, Experience exp) {
    final minMinutes = exp == Experience.beginner ? 8 * 60 : 6 * 60;
    final earliestStart = toMinutes(span.earliest) - 30;
    final latestEnd = toMinutes(span.latest) + 30;
    final biggestLength = latestEnd - earliestStart;

    final length = biggestLength < minMinutes ? minMinutes : biggestLength;

    final dayEarliestMinutes = toMinutes(dayEarliest);
    final dayLatestMinutes = toMinutes(dayLatest);
    
    final options = <TREoption>[];

    final eartlyStart = earliestStart.clamp(dayEarliestMinutes, dayLatestMinutes - length);
    final earlyEnd = eartlyStart + length;
    if (earlyEnd <= dayLatestMinutes) {
      options.add(TREoption(toTimeOfDay(eartlyStart), toTimeOfDay(earlyEnd), Duration(minutes: length), 'Early TRE', 'A ${length ~/ 60}-hour eating window, starting at ${toTimeOfDay(eartlyStart)}'));
    }

    final lateEnd = latestEnd.clamp(dayEarliestMinutes + length, dayLatestMinutes);
    final lateStart = lateEnd - length;
    if (lateStart >= dayEarliestMinutes && lateStart != eartlyStart) {
      options.add(TREoption(toTimeOfDay(lateStart), toTimeOfDay(lateEnd), Duration(minutes: length), 'Late TRE', 'A ${length ~/ 60}-hour eating window, starting at ${toTimeOfDay(eartlyStart)}'));
    }

    if (length - biggestLength > 0) {
      final otherLength = length + 60;
      final otherStart = earliestStart.clamp(dayEarliestMinutes, dayLatestMinutes - otherLength);
      final otherEnd = otherStart + otherLength;

      if (otherEnd <= dayLatestMinutes) {
        options.add(TREoption(toTimeOfDay(otherStart), toTimeOfDay(otherEnd), Duration(minutes: otherLength), 'Other', 'A more generous ${otherLength ~/ 60}-hour window if you\'d like extra flexibility beyond the minimum needed.'));
      }
    }

    return Suggestion.tre([], '');
  }

  Suggestion adfEvaluation(ObligationMeals meals, Experience exp) {
    final getAvailable = findAvailableDays(meals, true);

    List<List<int>> combinations = validCombos(3, getAvailable);

    adfList = combinations;

    return Suggestion.adf(combinations, 'Experienced and timetable');
  }

  Suggestion fiveTwoEvaluation(ObligationMeals meals, Experience exp) {
    final getAvailable = findAvailableDays(meals, true);

    List<List<int>> pairs = isValidCombo(getAvailable);

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

  List<List<int>> findCombos(List<int> pool, int cap) {
    if (pool.isEmpty) return [];

    final List<List<int>> allCombos = [];

    List<List<int>> create(List<int> subpool, int initDay, List<List<int>> acc, List<int> cur) {
      if (subpool.isEmpty || cur.length >= cap) return [...acc, cur];
      List<List<int>> withDay = [], withoutDay = [];
      if (initDay + 1 < subpool.first) {
        withoutDay = create(subpool.sublist(1), initDay, acc, cur);
        cur = [...cur, subpool.first];
        withDay = create(subpool.sublist(1), subpool.first, acc, cur);
      } else {
        withoutDay = create(subpool.sublist(1), initDay, acc, cur);
      }
      return [...withDay, ...withoutDay];
    }

    for (int loop = 0; loop < pool.length; loop++) {
      final List<int> curCombo = [];

    }
  }

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

  List<List<int>> isValidADFCombo(List<int> pool) {
    final twoDayCombos = isValidCombo(pool);
    if (twoDayCombos.isEmpty) return [];
    
    List<List<int>> output = [];
    for (final initCombo in twoDayCombos) {
      final remainingDays = pool.sublist(pool.indexOf(initCombo.last) + 1);
      final temp = isValidCombo(remainingDays);
      output.addAll(temp);
    }
    output.addAll(twoDayCombos);
    return output;
  }

  static List<List<int>> isValidCombo(List<int> pool) {
    if (pool.isEmpty) {
      return [];
    }
    int testAgainst = pool.first;
    List<List<int>> options = [];

    List<List<int>> isValid(List<int> subPool, List<List<int>> acc) {
      if (subPool.isEmpty) return acc;
      if (subPool.first > testAgainst + 1) {
        List<int> curCombo = [testAgainst, subPool.first];
        final temp = subPool.sublist(1);
        acc.add(curCombo);
        return isValid(temp, acc);
      } else {
        return isValid(subPool.sublist(1), acc);
      }
    }

    for (final day in pool) {
      testAgainst = day;

      final test = isValid(pool.sublist(pool.indexOf(day)), []);
      options.addAll(test);
    }
    return options;
  }

  List<List<int>> combos(int cap, List<int> pool) {
    if (pool.isEmpty) return [];
    final first = pool.first;
    final rest = pool.sublist(first);
    final withWrap = combos(cap - 1, rest).map((c) => [first, ...c]).toList();
    final noWrap = combos(cap, rest);
    return [...withWrap, ...noWrap];
  }

  List<List<int>> validCombos(int cap, List<int> pool) {
    return combos(cap, pool).where((combo) {
      final setForm = combo.toSet();
      return combo.every((d) => !setForm.contains((d + 1) % 7));
    }).toList();
  }

  bool checkConsecutive(int small, int large) {
    return large > small + 1;
  }
}

extension FastingDaysCombo on List<int> {}

sealed class FastBase {
  const FastBase();
}

class FastTRE extends FastBase {
  final int fastHours;
  final int eatingHours;
  final String descr;
  final Experience exp;

  FastTRE({
    required this.fastHours,
    required this.eatingHours,
    required this.descr,
    required this.exp,
  });
}

class FastADF extends FastBase {
  final String descr;
  final Experience exp;
  final List<int> fastDays;

  FastADF(this.descr, this.exp, {required this.fastDays});
}

class Fast52 extends FastBase {
  final String descr;
  final Experience exp;
  final List<int> fastDays;

  Fast52(this.descr, this.exp, {required this.fastDays});
}

extension ConsistentOutput on FastBase {
  String get fastDescription => switch (this) {
    FastTRE() =>
      'Fast for a set amount of hours during the day, and eat as normal in the remaining time',
    FastADF() =>
      'Alternate days of fasting with days of normal eating for several days a week.',
    Fast52() =>
      'Eat as normal for five days of the week, but eat only a third of your normal amount for the remaining two days',
  };

  String get specificFastDescription => switch (this) {
    FastTRE(fastHours: var f, eatingHours: var e) => '$f:$e',
    FastADF(fastDays: var d) => throw UnimplementedError(),
    Fast52(fastDays: var d) => throw UnimplementedError(),
  };
}

class DefaltsFast {
  static List<FastBase> suggestions = [
    FastTRE(
      fastHours: 12,
      eatingHours: 12,
      descr: 'A good way to ease into the lifestyle',
      exp: Experience.beginner,
    ),
  ];
}

class FastingRecommendation {
  final FastingForm form; // TRE, ADF, or Modified52
  final String rationale; // short user-facing explanation
  final Map<String, String> ruleTrace;

  FastingRecommendation({
    required this.form,
    required this.rationale,
    required this.ruleTrace,
  }); // for your audit trail / thesis appendix
}

enum IFReason { weightLoss, appearance, health, flexibility }

FastingRecommendation recommendPlan({
  required String experience, // 'Beginner' | 'Intermediate' | 'Advanced'
  required IFReason reason,
  required List<bool> obligationDays,
  required int obligationMealCount,
}) {
  final obligatedCount = obligationDays.where((d) => d).length;
  final trace = <String, String>{};

  // Rule 1: heavy social/meal obligation load -> TRE
  // Rationale: ADF and 5:2 require full-day adherence on fixed days;
  // TRE only restricts a daily window, which flexes around obligated meals.
  if (obligatedCount >= 4 || obligationMealCount >= 2) {
    trace['obligationLoad'] =
        'high ($obligatedCount days, $obligationMealCount meals/day) -> TRE preferred';
    return FastingRecommendation(
      form: FastingForm.tre,
      rationale:
          'With frequent fixed meal commitments, a daily eating-window '
          'approach (TRE) is easier to sustain than full-day fasts.',
      ruleTrace: trace,
    );
  }

  // Rule 2: Beginner + low obligation -> TRE regardless of reason
  // Rationale: TRE has the lowest adherence barrier for someone new to IF.
  if (experience == 'Beginner') {
    trace['experience'] = 'Beginner -> TRE (lowest barrier to entry)';
    return FastingRecommendation(
      form: FastingForm.tre,
      rationale:
          'As a beginner, starting with a daily eating window (TRE) '
          'builds the habit before moving to full-day fasts.',
      ruleTrace: trace,
    );
  }

  // Rule 3: Intermediate/Advanced + low obligation -> split on reason
  if (obligatedCount <= 1) {
    if (reason == IFReason.weightLoss || reason == IFReason.appearance) {
      trace['reason'] = '${reason.name} + low obligation + experienced -> ADF';
      return FastingRecommendation(
        form: FastingForm.adf,
        rationale:
            'With your experience level and few fixed obligations, '
            'alternate-day fasting gives a stronger caloric deficit for '
            'weight/appearance goals.',
        ruleTrace: trace,
      );
    } else {
      trace['reason'] =
          '${reason.name} + low obligation + experienced -> Modified 5:2';
      return FastingRecommendation(
        form: FastingForm.fiveTwo,
        rationale:
            'For sustained health benefits without daily disruption, '
            '5:2 offers a good balance for your goals.',
        ruleTrace: trace,
      );
    }
  }

  // Rule 4: fallback — moderate obligation, experienced
  trace['fallback'] = 'moderate obligation, experienced -> Modified 5:2';
  return FastingRecommendation(
    form: FastingForm.fiveTwo,
    rationale:
        '5:2 balances flexibility with your experience level given '
        'your current schedule.',
    ruleTrace: trace,
  );
}
