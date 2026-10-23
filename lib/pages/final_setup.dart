import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/reminder_model.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/utils/notifiers/concerns_notifier.dart';
import 'package:testrun/utils/notifiers/goal_notifier.dart';
import 'package:testrun/utils/suggestions.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/custom_checkbox.dart';
import 'package:testrun/widgets/dialogs.dart';

class FinalSetup extends ConsumerStatefulWidget {
  final User almost;
  final ObligationMeals obligations;
  final List<FastOption> options;
  final String weight;

  const FinalSetup({
    super.key,
    required this.almost,
    required this.obligations,
    required this.options,
    required this.weight,
  });

  @override
  ConsumerState<FinalSetup> createState() => _FinalSetupState();
}

class _FinalSetupState extends ConsumerState<FinalSetup> {
  late FastOption? selectedOption;
  FastingForm selectedForm = FastingForm.tre;
  int scheduleSelected = -1;
  FastingForm? customForm;
  Set<FastingForm> selectedForms = {};
  TimeOfDay start = TimeOfDay(hour: 0, minute: 0),
      end = TimeOfDay(hour: 0, minute: 0);
  String startText = 'Start', endText = 'End';
  List<bool> adfDaysSelected = List.filled(7, false);
  List<bool> fiveTwoDaysSelected = List.filled(7, false);

  @override
  void initState() {
    super.initState();

    selectedOption = widget.options.first;
    selectedForm = switch (selectedOption) {
      TREoption() => FastingForm.tre,
      ADFoption() => FastingForm.adf,
      ModifiedOption() => FastingForm.fiveTwo,
      _ => FastingForm.tre,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        FilledButton(
          onPressed: () async {
            if (selectedForms.isEmpty && selectedOption == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'You need to create or select a fasting plan to proceed',
                    style: const TextStyle(fontSize: TextSizing.smallmed),
                  ),
                ),
              );
              return;
            }
            final decision = true;

            if (decision) {
              if (selectedForm == FastingForm.fiveTwo &&
                  !_hasValidDaySelection(fiveTwoDaysSelected, false)) {
                if (!await planDecision(fiveTwoDaysSelected, false)) return;
              }
              if (selectedForm == FastingForm.adf &&
                  !_hasValidDaySelection(adfDaysSelected, true)) {
                if (!await planDecision(adfDaysSelected, true)) return;
              }
              if (selectedForm == FastingForm.tre &&
                  selectedOption == null &&
                  !isValidTRE(start, end)) {
                if (!context.mounted) return;
                await showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Invalid Fasting Times Selected'),
                    content: const Text(
                      'Your eating window should be between 1 and 12 hours.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                return;
              }

              String cur52Schedule;
              late MetricType type;
              late int threshold;

              if (selectedForm == FastingForm.fiveTwo) {
                cur52Schedule = selectedOption == null
                    ? boolsToInts(fiveTwoDaysSelected).join(',')
                    : (selectedOption as ModifiedOption).days.join(',');
                type = MetricType.meals52;
                threshold = 700;
              } else {
                cur52Schedule = '';
              }

              String curADFSchedule;
              if (selectedForm == FastingForm.adf) {
                final days = selectedOption == null
                    ? boolsToInts(adfDaysSelected)
                    : (selectedOption as ADFoption).days;
                curADFSchedule = days.join(',');
                type = MetricType.days;
                threshold = days.length;
              } else {
                curADFSchedule = '';
              }

              List<DateTime> times;
              if (selectedForm == FastingForm.tre) {
                final temp = selectedOption;
                times = temp is TREoption
                    ? [
                        DateTime(
                          2026,
                          1,
                          2,
                          temp.start.hour,
                          temp.start.minute,
                        ),
                        DateTime(2026, 1, 1, temp.end.hour, temp.end.minute),
                      ]
                    : [
                        DateTime(2026, 1, 2, start.hour, start.minute),
                        DateTime(2026, 1, 1, end.hour, end.minute),
                      ];
                type = MetricType.hours;
                threshold = times[1].difference(times[0]).inHours.abs() - 1;
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
                    widget.almost.isGender,
                  );
              ref
                  .read(wDaoProvider)
                  .logWeight(id, DateTime.now(), double.parse(widget.weight));

              await ref
                  .read(asyncGoalsProvider.notifier)
                  .insertInitialFastinggoal(id, threshold, type);
              await ref
                  .read(asyncGoalsProvider.notifier)
                  .insertInitialHydrationgoal(id);

              await NotificationSystem.requestPermission();

              ref.invalidate(userSessionProvider);
              ref.invalidate(asyncConcernsProvider);

              if (!context.mounted) return;
              Navigator.pushNamed(context, '/');
            }
          },
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ),
      ],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          children: [
            const SizedBox(height: 20),
            const Text(
              'The results are in',
              style: TextStyle(fontSize: TextSizing.large),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'The suggested fasting schedules are below, but you can choose to make your own in the Fasting Plan page',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
            ),

            RadioGroup<FastOption>(
              groupValue: selectedOption,
              onChanged: (FastOption? value) {
                setState(() {
                  if (selectedOption == value) {
                    selectedOption = null;
                  } else {
                    selectedForms.clear();
                    selectedOption = value;
                    if (value is TREoption) {
                      selectedForm = FastingForm.tre;
                    } else if (value is ADFoption) {
                      selectedForm = FastingForm.adf;
                    } else {
                      selectedForm = FastingForm.fiveTwo;
                    }
                  }
                });
              },
              child: Column(
                children: widget.options.map((option) {
                  return ListTile(
                    onTap: () {
                      if (selectedOption == option) {
                        setState(() {
                          selectedOption = null;
                        });
                      } else {
                        setState(() {
                          selectedOption = option;
                          selectedForms.clear();
                          if (selectedOption is TREoption) {
                            selectedForm = FastingForm.tre;
                          } else if (selectedOption is ADFoption) {
                            selectedForm = FastingForm.adf;
                          } else {
                            selectedForm = FastingForm.fiveTwo;
                          }
                        });
                      }
                    },
                    leading: Radio<FastOption>(value: option),
                    title: Text(
                      option.label,
                      style: const TextStyle(fontSize: TextSizing.medium),
                    ),
                    subtitle: Text(
                      option.justification,
                      style: const TextStyle(fontSize: TextSizing.small),
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'You can choose one of the above options to start with, or you can make one yourself below or in the Fasting Plan page.',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
            ),

            SegmentedButton<FastingForm>(
              segments: FastingForm.values.map((ff) {
                return ButtonSegment<FastingForm>(
                  value: ff,
                  label: Text(ff.label),
                );
              }).toList(),
              selected: selectedForms,
              onSelectionChanged: (Set<FastingForm> newForm) {
                setState(() {
                  selectedForms = newForm;
                  if (selectedForms.isNotEmpty) {
                    selectedForm = selectedForms.first;
                    selectedOption = null;
                  }
                });
              },
              emptySelectionAllowed: true,
            ),
            if (selectedForms.contains(FastingForm.tre)) ...[
              Padding(
                padding: EdgeInsets.all(15),
                child: const Text(
                  'Select Eating Window Times',
                  style: TextStyle(fontSize: TextSizing.large),
                ),
              ),
              Table(
                children: [
                  const TableRow(
                    children: [
                      Center(
                        child: Text(
                          'Starting Time',
                          style: TextStyle(fontSize: TextSizing.medium),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Ending Time',
                          style: TextStyle(fontSize: TextSizing.medium),
                        ),
                      ),
                    ],
                  ),
                  const TableRow(
                    children: [SizedBox(height: 10), SizedBox(height: 10)],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => selectStartTime(),
                          child: Text(
                            startText,
                            style: TextStyle(fontSize: TextSizing.medium),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => selectEndTime(),
                          child: Text(
                            endText,
                            style: TextStyle(fontSize: TextSizing.medium),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
            if (selectedForms.contains(FastingForm.fiveTwo)) ...[
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Select Fasting Days',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (c) => getBox(c)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (c) => getBox(c + 4)),
                ),
              ),
            ],
            if (selectedForms.contains(FastingForm.adf)) ...[
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Select Fasting Days',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (c) => getADFBox(c)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (c) => getADFBox(c + 4)),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Converts a list of boolean values representing selected days into a list of integers corresponding to the indices of the selected days.
  List<int> boolsToInts(List<bool> days) => [
    for (int loop = 0; loop < days.length; loop++)
      if (days[loop]) loop,
  ];

  /// Checks if the selected days for a fasting schedule are valid based on the type of fasting (ADF or 5:2).
  ///
  /// [days] is a list of boolean values representing the selected days of the week.
  /// [isADF] is a boolean indicating whether the fasting type is Alternate Day Fasting (ADF) or 5:2 fasting.
  /// Returns true if the selected days are valid, false otherwise.
  bool _hasValidDaySelection(List<bool> days, bool isADF) {
    final availability = RecommendationSystem.validCombosHelper(
      boolsToInts(days),
      isADF,
    );
    availability.removeWhere(
      (days) => days.isEmpty || days.length != (isADF ? 3 : 2),
    );
    return isADF ? availability.isNotEmpty : availability.length == 1;
  }

  /// Validates the selected time-restricted eating (TRE) window to ensure it is between 1 and 12 hours.
  ///
  /// [startTime] is the starting time of the eating window.
  /// [endTime] is the ending time of the eating window.
  bool isValidTRE(TimeOfDay startTime, TimeOfDay endTime) {
    final startMinutes = startTime.hour * 60 + startTime.minute;
    final endMinutes = endTime.hour * 60 + endTime.minute;
    final duration = (endMinutes - startMinutes + 1440) % 1440;
    return duration > 0 && duration <= 720;
  }

  CustomCheckbox getBox(int index) {
    return .new(
      isSelected: fiveTwoDaysSelected[index],
      dayOfWeek: daysOfWeek[index],
      onTap: (bool val) {
        final tempList = [...fiveTwoDaysSelected];
        tempList[index] = val;

        final availability = RecommendationSystem.validCombosHelper(
          boolsToInts(tempList),
          false,
        );
        availability.removeWhere((a) => a.isEmpty || a.length != 2);
        if (availability.length == 1) {
          setState(() {
            fiveTwoDaysSelected[index] = val;
          });
        } else {
          planDecision(tempList, false);
        }
      },
    );
  }

  CustomCheckbox getADFBox(int index) => .new(
    isSelected: adfDaysSelected[index],
    dayOfWeek: daysOfWeek[index],
    onTap: (bool val) {
      final tempList = [...adfDaysSelected];
      tempList[index] = val;

      final availability = RecommendationSystem.validCombosHelper(
        boolsToInts(tempList),
        true,
      );
      availability.removeWhere((a) => a.isEmpty || a.length != 3);
      if (availability.isNotEmpty) {
        setState(() {
          adfDaysSelected[index] = val;
        });
      } else {
        planDecision(tempList, true);
      }
    },
  );

  /// Displays a dialog to inform the user about invalid fasting day selections and allows them to either cancel or continue with their selection.
  Future<bool> planDecision(List<bool> list, bool isADF) async {
    final decision = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            'Invalid Fasting Days Selected',
            style: TextStyle(fontSize: TextSizing.large),
          ),
        ),
        content: Text(
          isADF
              ? 'You should have 3 non-consecutive fasting days selected'
              : 'You should have 2 non-consecutive fasting days selected',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: TextSizing.medlarge),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'Continue',
              style: TextStyle(fontSize: TextSizing.medlarge),
            ),
          ),
        ],
      ),
    );

    if (decision == true) {
      if (isADF) {
        setState(() {
          adfDaysSelected = List<bool>.from(list);
        });
      } else {
        setState(() {
          fiveTwoDaysSelected = List<bool>.from(list);
        });
      }
    }
    return decision == true;
  }

  Future<void> selectStartTime() async {
    final time = await Dialogs.showTimeInput(context, initialTime: start);
    if (time != null) {
      final outcome = start == end || isValidTRE(time, end);
      setState(() {
        if (outcome) {
          start = time;
          startText = time.format(context);
        } else {
          //! Pop up to warn user
        }
      });
    }
  }

  Future<void> selectEndTime() async {
    final time = await Dialogs.showTimeInput(context, initialTime: end);
    if (time != null) {
      final outcome = start == end || isValidTRE(start, time);
      setState(() {
        if (outcome) {
          end = time;
          endText = time.format(context);
        } else {
          //! Pop up to warn user
        }
      });
    }
  }
}
