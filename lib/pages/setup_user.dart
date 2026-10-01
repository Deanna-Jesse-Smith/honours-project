
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/pages/final_setup.dart';
import 'package:testrun/utils/suggestions.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/custom_checkbox.dart';
import 'package:testrun/widgets/dialogs.dart';

class SetupUser extends ConsumerStatefulWidget {
  final String name;
  final bool experience;

  const SetupUser({super.key, required this.name, required this.experience});

  @override
  ConsumerState<SetupUser> createState() => _SetupUserState();
}

enum Measurement { metric, imperial }

class _SetupUserState extends ConsumerState<SetupUser> {
  FastingForm dropDownValuee = FastingForm.tre;
  Measurement? measurement = Measurement.metric;
  DateTime selectedDate = DateTime(2008);

  bool obligationVisibility = false;
  List<bool> obligationDays = List.filled(7, false);

  final TextEditingController heightController = TextEditingController(
    text: '0',
  );
  final TextEditingController weightController = TextEditingController(
    text: '0',
  );
  final TextEditingController durationController = TextEditingController(
    text: '1',
  );

  final focusNodeHeight = FocusNode(),
      focusNodeWeight = FocusNode(),
      focusNodeDuration = FocusNode();

  bool isSaving = false;

  Experience exp = Experience.beginner;
  Set<bool> gender = {};

  @override
  void initState() {
    super.initState();

    debugPrint('In setup. ${widget.name}, ${widget.experience}');

    focusNodeHeight.addListener(() {
      if (focusNodeHeight.hasFocus) {
        heightController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: heightController.text.length,
        );
      }
    });

    focusNodeWeight.addListener(() {
      if (focusNodeWeight.hasFocus) {
        weightController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: weightController.text.length,
        );
      }
    });

    focusNodeDuration.addListener(() {
      if (focusNodeDuration.hasFocus) {
        durationController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: durationController.text.length,
        );
      }
    });
  }

  @override
  void dispose() {
    focusNodeHeight.dispose();
    focusNodeDuration.dispose();
    focusNodeWeight.dispose();

    heightController.dispose();
    weightController.dispose();
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questionnaire'), centerTitle: true),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        FilledButton(
          onPressed: handleFinished,
          child: const Text(
            'Finished',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //   child: Text(
            //     'Forms of Intermittent Fasting',
            //     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: TextSizing.medium),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // buildTextCard(
            //   'Time Restricted Eating',
            //   'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
            // ),
            // buildTextCard(
            //   'Alternate Day Fasting',
            //   'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
            // ),
            // buildTextCard(
            //   'Modified Fasting/5:2',
            //   'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
            // ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Questions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: TextSizing.medium,
                ),
              ),
            ),
            if (widget.experience)
              buildWithExperience(), //? What form(s) of IF have you done before? And for how long (weeks)?
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text(
            //         'When were you born?',
            //         style: TextStyle(fontSize: TextSizing.medium),
            //       ),
            //       ElevatedButton(
            //         onPressed: () async {
            //           final DateTime? dateTime = await showDatePicker(
            //             context: context,
            //             initialDate: selectedDate,
            //             firstDate: DateTime(2000),
            //             lastDate: DateTime(3000),
            //           );
            //           if (dateTime != null) {
            //             setState(() {
            //               selectedDate = dateTime;
            //             });
            //           }
            //         },
            //         child: const Text('Select Birthday', style: TextStyle(fontSize: TextSizing.smallmed),),
            //       ),
            //     ],
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text(
            //         'Are you male or female?',
            //         style: TextStyle(fontSize: TextSizing.medium),
            //       ),
            //       RadioGroup<bool>(
            //             onChanged: (bool? value) {
            //               setState(() => isFemale = value!);
            //             },
            //             groupValue: isFemale,
            //             child: const Column(
            //               children: [
            //                 RadioListTile(
            //                   value: true,
            //                   title: Text(
            //                     'Female',
            //                     style: TextStyle(fontSize: TextSizing.small),
            //                   ),
            //                 ),
            //                 RadioListTile(
            //                   value: false,
            //                   title: Text(
            //                     'Male',
            //                     style: TextStyle(fontSize: TextSizing.small),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Text(
                    'Are you male or female?',
                    style: TextStyle(fontSize: TextSizing.medium),
                  ),
                  SegmentedButton<bool>(
                    segments: genders,
                    selected: gender,
                    onSelectionChanged: (Set<bool> cur) {
                      setState(() {
                        gender = cur;
                      });
                    },
                    emptySelectionAllowed: true,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text(
                    'How tall are you?',
                    style: TextStyle(fontSize: TextSizing.medium),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: heightController,
                      focusNode: focusNodeHeight,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                      decoration: InputDecoration(suffixText: 'cm'),
                      style: TextStyle(fontSize: TextSizing.medium),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'How much do you weigh?',
                    style: TextStyle(fontSize: TextSizing.medium),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: weightController,
                      focusNode: focusNodeWeight,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(suffixText: 'kg'),
                      style: TextStyle(fontSize: TextSizing.medium),
                    ),
                  ),
                ],
              ),
            ),

            struggle(), //? What do you struggle most with: daily schedule change or a weekly change?

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: const Text(
                      'Do you eat meals with family or friends regularly?',
                      style: TextStyle(fontSize: TextSizing.medium),
                    ),
                  ),
                  Checkbox(
                    value: obligationVisibility,
                    onChanged: (value) {
                      setState(() => obligationVisibility = value ?? false);
                    },
                  ),
                ],
              ),
            ),

            if (obligationVisibility) getWeek(),

            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ElevatedButton(
            //       onPressed: isSaving ? null : handleFinished,
            //       child: isSaving
            //           ? const SizedBox(
            //               width: 16,
            //               height: 16,
            //               child: CircularProgressIndicator(strokeWidth: 2),
            //             )
            //           : const Text('Finished', style: TextStyle(fontSize: TextSizing.medium)),
            //     ),
            //   ),
            // ),

            // What do you hope to achieve with IF?

            // What is your preferred flexibility in your IF schedule?
          ],
        ),
      ),
    );
  }

  static final List<ButtonSegment<bool>> genders = [
    ButtonSegment(
      value: true,
      label: Text('Female', style: const TextStyle(fontSize: TextSizing.small)),
    ),
    ButtonSegment(
      value: false,
      label: Text('Male', style: const TextStyle(fontSize: TextSizing.small)),
    ),
  ];

  /// Handles the finished button press event. Checks that all required fields are filled in, creates a temporary user and obligation meals, generates recommendations, and navigates to the FinalSetup page. Displays a snackbar message if any required fields are missing or if there is an error saving the user.
  Future<void> handleFinished() async {
    setState(() => isSaving = true);
    if (heightController.text.isEmpty ||
        weightController.text.isEmpty ||
        gender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'You need to fill in your height, weight and gender to proceed',style: const TextStyle(fontSize: TextSizing.smallmed),
          ),
        ),
      );
    } else {
      try {
        if (!mounted) return;

        List<int> tempDays = boolsToInts(obligationDays);

        User tempUser = User(
          userID: 0,
          name: widget.name,
          isMetric: measurement == Measurement.metric,
          experience: exp,
          createdDate: DateTime.now(),
          formIF: dropDownValuee,
          adfDaysSelected: '',
          fiveTwoDaysSelected: '',
          height: double.parse(heightController.text),
          isGender: gender.first,
        );
        ObligationMeals temp = ObligationMeals(tempDays, obligationTimes);
        RecommendationSystem rs = RecommendationSystem(
          prevForms: selectedForms,
          prevDuration: int.parse(durationController.text),
          struggle: selectedStruggle,
          meals: temp,
          exp: widget.experience ? Experience.experienced : Experience.beginner,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FinalSetup(
              almost: tempUser,
              obligations: temp,
              options: rs.getRecs(),
              weight: weightController.text,
            ),
          ),
        );
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not save user: $e')));
      } finally {
        if (mounted) setState(() => isSaving = false);
      }
    }
  }

  List<int> boolsToInts(List<bool> days) => [
    for (int loop = 0; loop < days.length; loop++)
      if (days[loop]) loop,
  ];

  Column getWeek() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (c) => getBox(c, obligationDays)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (c) => getBox(c + 4, obligationDays)),
          ),
        ),
        const Text('Which meals are reserved for these obligations?'),
        for (int loop = 0; loop < obligationTimes.length; loop++)
          getObligationMeal(loop),
        if (obligationTimes.length < mealCap)
          ElevatedButton(
            onPressed: () =>
                setState(() => obligationTimes.add(TimeOfDay.now())),
            child: const Text(
              '+',
              style: TextStyle(fontSize: TextSizing.large),
            ),
          ),
      ],
    );
  }

  // Future<void> createObligationMeal() {

  // }

  static const int mealCap = 3;
  List<TimeOfDay> obligationTimes = [
    TimeOfDay(hour: 12, minute: 0),
    TimeOfDay(hour: 18, minute: 0),
  ];
  String mealOneText = '+', mealTwoText = '+', mealThreeText = '+';

  Row getObligationMeal(int index) {
    TimeOfDay? time = obligationTimes[index];
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => selectMealTime(index),
          child: Text(time == null ? '+' : time.format(context)),
        ),
        IconButton(
          onPressed: () => setState(() => obligationTimes.removeAt(index)),
          icon: Icon(Icons.cancel),
        ),
      ],
    );
  }

  Future<void> selectMealTime(int index) async {
    final time = await Dialogs.showTimeInput(context);
    if (time != null) {
      setState(() => obligationTimes[index] = time);
    }
  }

  CustomCheckbox getBox(int index, List<bool> curList) => CustomCheckbox(
    isSelected: curList[index],
    dayOfWeek: daysOfWeek[index],
    onTap: (bool val) {
      setState(() {
        curList[index] = val;
      });
    },
  );

  Widget buildTextCard(String title, text) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ExpansionTile(
          title: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: TextSizing.medium),
          ),
          children: [Text(text, style: TextStyle(fontSize: TextSizing.medium))],
        ),
      ),
    );
  }

  Set<FastingForm> selectedForms = {};

  Widget buildWithExperience() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          const Text(
            'What form(s) of intermittent fasting have you done before?',
            style: TextStyle(fontSize: TextSizing.medium),
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
              });
            },
            multiSelectionEnabled: true,
            emptySelectionAllowed: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'For what duration?',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
              SizedBox(
                width: 80,
                child: TextField(
                  controller: durationController,
                  focusNode: focusNodeDuration,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: false,
                    signed: false,
                  ),
                  decoration: InputDecoration(suffixText: 'weeks'),
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget whatToAchieve() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          const Text('What do you hope to achieve with intermittent fasting?'),
        ],
      ),
    );
  }

  List<String> struggles = ['Weekly schedule change', 'Daily schedule change'];
  Set<Struggle> selectedStruggle = {};

  Widget struggle() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          const Text(
            'What do you struggle more with?',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
          SegmentedButton<Struggle>(
            segments: Struggle.values.map((s) {
              return ButtonSegment(
                value: s,
                label: Text(
                  s == Struggle.weekly
                      ? 'Weekly schedule change'
                      : 'Daily schedule change',
                  style: TextStyle(fontSize: TextSizing.small),
                ),
              );
            }).toList(),
            selected: selectedStruggle,
            onSelectionChanged: (Set<Struggle> str) {
              setState(() {
                selectedStruggle = str;
              });
            },
            emptySelectionAllowed: true,
          ),
        ],
      ),
    );
  }

  Widget flexibility() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            'Do you prefer more or less flexibility in your eating schedule?',
          ),
        ],
      ),
    );
  }
}
