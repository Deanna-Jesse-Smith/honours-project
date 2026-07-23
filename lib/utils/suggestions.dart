import 'package:testrun/models/converters.dart';

class HydrationDefaults {
  final String gender;
  late double amount;

  HydrationDefaults(this.gender);
  
  double getDailyWater() {
    return 1.0; //! To be made into something to calculate the amount when I have time later
  }
}

enum Experience {beginner, intermediate, experienced}

sealed class FastBase {
  const FastBase();
}

class FastTRE extends FastBase {
  final int fastHours;
  final int eatingHours;
  final String descr;
  final Experience exp;

  FastTRE({required this.fastHours, required this.eatingHours, required this.descr, required this.exp});
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
    FastTRE() => 'Fast for a set amount of hours during the day, and eat as normal in the remaining time',
    FastADF() => 'Alternate days of fasting with days of normal eating for several days a week.',
    Fast52() => 'Eat as normal for five days of the week, but eat only a third of your normal amount for the remaining two days',
  };

  String get specificFastDescription => switch (this) {
    FastTRE(fastHours: var f, eatingHours: var e) => '$f:$e',
    FastADF(fastDays: var d) => throw UnimplementedError(),
    Fast52(fastDays: var d) => throw UnimplementedError(),
  };
}

class DefaltsFast {
  static List<FastBase> suggestions = [
    FastTRE(fastHours: 12, eatingHours: 12, descr: 'A good way to ease into the lifestyle', exp: Experience.beginner),
  ];
}

class FastingRecommendation {
  final FastingForm form; // TRE, ADF, or Modified52
  final String rationale; // short user-facing explanation
  final Map<String, String> ruleTrace;

  FastingRecommendation({required this.form, required this.rationale, required this.ruleTrace}); // for your audit trail / thesis appendix
  
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
    trace['obligationLoad'] = 'high ($obligatedCount days, $obligationMealCount meals/day) -> TRE preferred';
    return FastingRecommendation(
      form: FastingForm.tre,
      rationale: 'With frequent fixed meal commitments, a daily eating-window '
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
      rationale: 'As a beginner, starting with a daily eating window (TRE) '
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
        rationale: 'With your experience level and few fixed obligations, '
            'alternate-day fasting gives a stronger caloric deficit for '
            'weight/appearance goals.',
        ruleTrace: trace,
      );
    } else {
      trace['reason'] = '${reason.name} + low obligation + experienced -> Modified 5:2';
      return FastingRecommendation(
        form: FastingForm.fiveTwo,
        rationale: 'For sustained health benefits without daily disruption, '
          '5:2 offers a good balance for your goals.',
        ruleTrace: trace,
      );
    }
  }

  // Rule 4: fallback — moderate obligation, experienced
  trace['fallback'] = 'moderate obligation, experienced -> Modified 5:2';
  return FastingRecommendation(
    form: FastingForm.fiveTwo,
    rationale: '5:2 balances flexibility with your experience level given '
        'your current schedule.',
    ruleTrace: trace,
  );
}