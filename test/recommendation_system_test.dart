import 'package:flutter/material.dart';
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

  test('ADF recommendations prioritize more fasting days', () {
    final recommendations = RecommendationSystem(
      prevForms: {FastingForm.adf},
      prevDuration: 9,
      struggle: {},
      meals: ObligationMeals([], []),
      exp: Experience.experienced,
    ).getRecs().whereType<ADFoption>();

    expect(recommendations, isNotEmpty);
    expect(
      recommendations.every((option) => option.days.length == 2),
      isTrue,
    );
  });

  test('TRE windows respect absolute bounds and prioritize preferred lengths', () {
    final options = RecommendationSystem(
      prevForms: {FastingForm.tre},
      prevDuration: 9,
      struggle: {},
      meals: ObligationMeals([], []),
      exp: Experience.experienced,
    ).treEvaluation(
      ObligationSpan.o(
        const TimeOfDay(hour: 12, minute: 0),
        const TimeOfDay(hour: 14, minute: 0),
      ),
      Experience.experienced,
    );

    expect(options, isNotEmpty);
    expect(
      options.every(
        (option) =>
            option.length.inMinutes >= 4 * 60 &&
          option.length.inMinutes <= 12 * 60,
      ),
      isTrue,
    );
    expect(options.first.length.inHours, 8);
    expect(options.any((option) => option.length.inHours == 4), isTrue);
    expect(options.any((option) => option.length.inHours == 12), isTrue);
  });

  test('TRE recommendations prefer 8–10 hour windows without meal obligations', () {
    final recommendations = RecommendationSystem(
      prevForms: {FastingForm.tre},
      prevDuration: 9,
      struggle: {},
      meals: ObligationMeals([], []),
      exp: Experience.experienced,
    ).getRecs().whereType<TREoption>();

    expect(recommendations, isNotEmpty);
    expect(
      recommendations.every(
        (option) =>
            option.length.inMinutes >= 8 * 60 &&
            option.length.inMinutes <= 10 * 60,
      ),
      isTrue,
    );
  });

  test('prior TRE experience ranks TRE options before other forms', () {
    final recommendations = RecommendationSystem(
      prevForms: {FastingForm.tre},
      prevDuration: 9,
      struggle: {Struggle.daily},
      meals: ObligationMeals([], []),
      exp: Experience.experienced,
    ).getRecs();

    expect(recommendations.first, isA<TREoption>());
  });
}