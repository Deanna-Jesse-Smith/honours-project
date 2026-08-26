import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/reminder_model.dart';
import 'package:testrun/utils/Notifiers/concerns_notifier.dart';
import 'package:testrun/utils/suggestions.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';

class FinalSetup extends ConsumerStatefulWidget {
  final User almost;
  final ObligationMeals obligations;
  final RecommendationSystem rs;
  final String weight;

  const FinalSetup({
    super.key,
    required this.almost,
    required this.obligations,
    required this.rs,
    required this.weight,
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
    final recs = widget.rs.getRecs();
    selectedOption = recs.first;

    // List<TimeOfDay> testTRE = plans[0].treList;
    return Scaffold(
      body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 20,
        children: [
          SizedBox(height: 20,),
          Text(
            'The results are in',
            style: TextStyle(fontSize: TextSizing.large),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              'The suggested fasting schedules are below, but you can choose to make your own',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
          ),
    
          RadioGroup<FastOption>(
            groupValue: selectedOption,
            onChanged: (FastOption? value) {
              setState(() {
                selectedOption = value;
              if (value is TREoption) {
                selectedForm = FastingForm.tre;
              } else if (value is ADFoption) {
                selectedForm = FastingForm.adf;
              } else {
                selectedForm = FastingForm.fiveTwo;
              }
              },);
            },
            child: Column(
              children: recs.map((option) {
                return RadioListTile<FastOption>(
                  value: option,
                  title: Text(option.label,
                    style: TextStyle(fontSize: TextSizing.medium),),
                  subtitle: Text(option.justification,
                    style: TextStyle(fontSize: TextSizing.small),),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Text(
              'You can choose one of the above options to start with, or you can make one yourself.',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
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
                  final temp = selectedOption as ModifiedOption;
                  cur52Schedule = temp.days.join(',');
                } else {
                  cur52Schedule = '';
                }
    
                String curADFSchedule;
                if (selectedForm == FastingForm.adf) {
                  final temp = selectedOption as ADFoption;
                  curADFSchedule = temp.days.join(',');
                } else {
                  curADFSchedule = '';
                }
    
                List<DateTime> times;
                if (selectedForm == FastingForm.tre) {
                  final temp = selectedOption as TREoption;
                  times = [
                    DateTime(2026, 1, 1, temp.start.hour, temp.start.minute),
                    DateTime(2026, 1, 1, temp.end.hour, temp.end.minute),
                  ];
                } else {
                  times = [DateTime(2026), DateTime(2026)];
                }
    
                final id = await ref
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
                      widget.almost.height,
                    );
                ref.read(wDaoProvider).logWeight(id, DateTime.now(), double.parse(widget.weight));
                
                await NotificationSystem.requestPermission();
                
                ref.invalidate(userSessionProvider);
                ref.invalidate(asyncConcernsProvider);

                if (!context.mounted) return;
                Navigator.pushNamed(context, '/');
              }
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    ));
  }
}
