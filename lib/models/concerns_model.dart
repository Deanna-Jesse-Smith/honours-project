import 'package:testrun/models/goals_model.dart';

sealed class BasicConcern implements Comparable {
  final int id;
  final GoalType? gType;
  final String title, text, citation;
  final int threshold, window;
  final DateTime? nextEval;

  BasicConcern(this.id, this.gType, this.title, this.text, this.threshold, this.window, this.citation, this.nextEval);

  BasicConcern copyWithEval(DateTime? newEval);
}

final class HealthConcern extends BasicConcern {
  HealthConcern(super.id, super.gType, super.title, super.text, super.threshold, super.window, super.citation, super.nextEval);

  @override
  HealthConcern copyWithEval(DateTime? newEval) {
    return HealthConcern(id, gType, title, text, threshold, window, citation, newEval);
  }

  @override
  int compareTo(other) {
    HealthConcern hc = other as HealthConcern;
    return hc.threshold.compareTo(threshold);
  }
}

final class PositiveReinforcement extends BasicConcern {
  PositiveReinforcement(super.id, super.gType, super.title, super.text, super.threshold, super.window, super.citation, super.nextEval);

  @override
  PositiveReinforcement copyWithEval(DateTime? newEval) {
    return PositiveReinforcement(id, gType, title, text, threshold, window, citation, newEval);
  }

  @override
  int compareTo(other) {
    PositiveReinforcement pr = other as PositiveReinforcement;
    return -pr.threshold.compareTo(threshold);
  }
}


enum ConcernType { health, pr, }