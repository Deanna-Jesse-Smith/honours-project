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