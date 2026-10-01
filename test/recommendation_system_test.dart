import 'package:flutter_test/flutter_test.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/utils/suggestions.dart';

void main() {
  test('experienced users with daily struggles can get ADF suggestions', () {
    final system = RecommendationSystem(
      prevForms: {},
      prevDuration: 9,
      struggle: {Struggle.daily},
      meals: ObligationMeals([], []),
    );
    final recommendations = system.getRecs();

    expect(
      system.scoreForm(FastingForm.adf),
      greaterThan(system.scoreForm(FastingForm.fiveTwo)),
    );
    expect(recommendations.first, isA<ADFoption>());
    expect(recommendations.whereType<ADFoption>(), isNotEmpty);
  });

  test('prior ADF experience produces ADF suggestions', () {
    final recommendations = RecommendationSystem(
      prevForms: {FastingForm.adf},
      prevDuration: 9,
      struggle: {Struggle.daily},
      meals: ObligationMeals([], []),
    ).getRecs();

    expect(recommendations.first, isA<ADFoption>());
    expect(recommendations.whereType<ADFoption>(), isNotEmpty);
  });
}