import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/utils/suggestions.dart';
import 'package:testrun/utils/text_sizing.dart';

class FinalSetup extends ConsumerStatefulWidget {
  final User almost;
  final ObligationMeals obligations;

  const FinalSetup({
    super.key,
    required this.almost,
    required this.obligations,
  });

  @override
  ConsumerState<FinalSetup> createState() => _FinalSetupState();
}

class _FinalSetupState extends ConsumerState<FinalSetup> {
  late FastingForm selectedForm;

  @override
  Widget build(BuildContext context) {
    final int curSelection = -1;
    RecommendFast rf = RecommendFast.o(
      FastingForm.tre,
      widget.obligations,
      Experience.beginner,
    );

    final plans = rf.makePlan();

    // List<TimeOfDay> testTRE = plans[0].treList;
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'The results are in',
            style: TextStyle(fontSize: TextSizing.large),
          ),
          Text(
            'Motivation/lead up to suggestions',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
          SizedBox(height: 40),
          Text(
            'The suggested fasting schedules are below, but you can choose to make your own',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
          RadioGroup<int>(onChanged: (int? value) {
            setState(() => FastingForm.tre);
          }, child: Column(children: plans.findTRE.map((plan) => RadioListTile(value: plan, title: Text('Start at: ${plan[0].format(context)}, end at: ${plan[1].format(context)}'),)).toList(),)),
          if (plans[1] != null) suggestionGroup(plans[1]),
          if (plans[2] != null) suggestionGroup(plans[2]),
        ],
      ),
    );
  }



  RadioGroup suggestionGroup(Suggestion sug) {
    final bool isFiveTwo = sug.isFiveTwo;
    final List<List<int>> days = isFiveTwo ? sug.fiveTwoList : sug.adfList;
    final int len = days.length;

    return RadioGroup<int>(
      onChanged: (int? value) {
        setState(() {
          selectedForm = isFiveTwo ? FastingForm.fiveTwo : FastingForm.adf;
        });
      },
      child: Column(
        children: List.generate(
          len,
          (t) => buildDaySuggestion(t, days[t]),
        ),
      ),
    );
  }

  RadioListTile<int> buildDaySuggestion(int index, List<int> viableDays) {
    final test = viableDays.map((day) => daysOfWeek[day]);
    String theseDays = test.join(', ');
    return RadioListTile<int>(value: index, title: Text(theseDays));
  }

  RadioListTile<int> buildTRESuggetsion(int index, List<TimeOfDay> vialbeTimes) {
    return .new(value: index, title: Text('Start at: ${vialbeTimes[0].format(context)}, end at: ${vialbeTimes[1].format(context)}'));
  }
}
