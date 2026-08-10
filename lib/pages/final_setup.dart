import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/pages/FastingPlan.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/utils/suggestions.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/dialogs.dart';

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
  int scheduleSelected = -1;

  @override
  Widget build(BuildContext context) {
    final int curSelection = -1;
    RecommendFast rf = RecommendFast.o(
      FastingForm.tre,
      widget.obligations,
      Experience.beginner,
    );
    rf.makePlan();

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
            setState(() {
              selectedForm = FastingForm.tre;
              scheduleSelected = value!;
            }
            );
          }, child: Column(children: Suggestion.treList.map((plan) => RadioListTile(value: plan, title: Text('Start at: ${plan[0].format(context)}, end at: ${plan[1].format(context)}'),)).toList(),)),
          if (Suggestion.fiveTwoList.isEmpty) suggestionGroup(List<List<int>>.from(Suggestion.fiveTwoList), true),
          if (Suggestion.adfList.isEmpty) suggestionGroup(List<List<int>>.from(Suggestion.adfList), true),
          SizedBox(height: 40,),
          const Text('You can choose one of the above options to start with, or you can make one yourself.', style: TextStyle(fontSize: TextSizing.medium),),
          ElevatedButton(onPressed: () async {
            final decision = await Dialogs.dangerDialog(context, title: 'Are you sure?', message: 'You won\'t be able to come back here after this.');

            if (decision) {
              String cur52Schedule = selectedForm == FastingForm.fiveTwo ? Suggestion.fiveTwoList[scheduleSelected].join(',') : '';
              String curADFSchedule = selectedForm == FastingForm.adf ? Suggestion.adfList[scheduleSelected].join(',') : '';

              DateTime today = DateTime.now();
              List<DateTime> times = selectedForm == FastingForm.tre ? Suggestion.treList[scheduleSelected].map((t) => t.convertToDateTime(today)).toList() : [DateTime(2026, 0, 0, 0, 0), DateTime(2026, 0, 0, 0, 0)];

              ref.read(uDaoProvider).addUser(widget.almost.name, widget.almost.isMetric, selectedForm, widget.almost.experience, times.first, times.last, cur52Schedule, curADFSchedule);

              if (!context.mounted) return;
              Navigator.pushNamed(context, '/');
            }
          }, child: const Text('Continue')),
        ],
      ),
    );
  }

  RadioGroup suggestionGroup(List<List<int>> days, bool isFiveTwo) {
    final int len = days.length;

    return RadioGroup<int>(
      onChanged: (int? value) {
        setState(() {
          selectedForm = isFiveTwo ? FastingForm.fiveTwo : FastingForm.adf;
          scheduleSelected = value!;
        }
        );
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
