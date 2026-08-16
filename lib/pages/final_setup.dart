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
  final RecommendationSystem rs;

  const FinalSetup({
    super.key,
    required this.almost,
    required this.obligations,
    required this.rs,
  });

  @override
  ConsumerState<FinalSetup> createState() => _FinalSetupState();
}

class _FinalSetupState extends ConsumerState<FinalSetup> {
  late FastOption? selectedOption;
  FastingForm selectedForm = FastingForm.tre;
  int scheduleSelected = -1;

  @override
  Widget build(BuildContext context) {
    int curSelection = -1;

    final recs = widget.rs.getRecs();

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

          RadioGroup<FastOption>(
            groupValue: selected,
            onChanged: (FastOption? value) {
              selected = value;
              if (value is TREoption) {
                selectedForm = FastingForm.tre;
              } else if (value is ADFoption) {
                selectedForm = FastingForm.adf;
              } else {
                selectedForm = FastingForm.fiveTwo;
              }
            },
            child: Column(
              children: recs.map((option) {
                return RadioListTile<FastOption>(
                  value: option,
                  title: Text(option.label),
                  subtitle: Text(option.justification),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 40),
          const Text(
            'You can choose one of the above options to start with, or you can make one yourself.',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
          ElevatedButton(
            onPressed: () async {
              final decision = await Dialogs.dangerDialog(
                context,
                title: 'Are you sure?',
                message: 'You won\'t be able to come back here after this.',
              );

              if (decision) {
                String cur52Schedule;
                if (selectedForm == FastingForm.fiveTwo) {
                  final temp = selected as ModifiedOption;
                  cur52Schedule = temp.days.join(',');
                } else {
                  cur52Schedule = '';
                }

                String curADFSchedule;
                if (selectedForm == FastingForm.adf) {
                  final temp = selected as ADFoption;
                  curADFSchedule = temp.days.join(',');
                } else {
                  curADFSchedule = '';
                }

                List<DateTime> times;
                if (selectedForm == FastingForm.tre) {
                  final temp = selected as TREoption;
                  times = [
                    DateTime(2026, 0, 0, temp.start.hour, temp.start.minute),
                    DateTime(2026, 0, 0, temp.end.hour, temp.end.minute),
                  ];
                } else {
                  times = [DateTime(2026), DateTime(2026)];
                }

                ref
                    .read(uDaoProvider)
                    .addUser(
                      widget.almost.name,
                      widget.almost.isMetric,
                      selectedForm,
                      widget.almost.experience,
                      times.first,
                      times.last,
                      cur52Schedule,
                      curADFSchedule,
                    );

                if (!context.mounted) return;
                Navigator.pushNamed(context, '/');
              }
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  FastOption? selected;

  RadioGroup recGroup(List<FastOption> options) {
    return RadioGroup<FastOption>(
      onChanged: (FastOption? value) {
        selected = value;
      },
      child: Column(
        children: List.generate(
          options.length,
          (o) => RadioListTile(
            value: options[o],
            title: Text(options[o].label),
            subtitle: Text(options[o].justification),
          ),
        ),
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
        });
      },
      child: Column(
        children: List.generate(len, (t) => buildDaySuggestion(t, days[t])),
      ),
    );
  }

  RadioListTile<int> buildDaySuggestion(int index, List<int> viableDays) {
    final test = viableDays.map((day) => daysOfWeek[day]);
    String theseDays = test.join(', ');
    return RadioListTile<int>(value: index, title: Text(theseDays));
  }

  RadioListTile<int> buildTRESuggetsion(
    int index,
    List<TimeOfDay> vialbeTimes,
  ) {
    return .new(
      value: index,
      title: Text(
        'Start at: ${vialbeTimes[0].format(context)}, end at: ${vialbeTimes[1].format(context)}',
      ),
    );
  }
}
