import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/pages/FastingPlan.dart';
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

  bool isSaving = false;

  Experience exp = Experience.beginner;

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questionnaire'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forms of Intermittent Fasting',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            buildTextCard(
              'Time Restricted Eating',
              'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
            ),
            buildTextCard(
              'Alternate Day Fasting',
              'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
            ),
            buildTextCard(
              'Modified Fasting/5:2',
              'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
            ),
            Text('Questions', style: TextStyle(fontWeight: FontWeight.bold)),
            if (widget.experience)
              buildWithExperience(), //? What form(s) of IF have you done before? And for how long (weeks)?
            buildQuestion('Do you prefer metric or imperial?'),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('When were you born?', style: TextStyle(fontSize: TextSizing.medium),),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    );
                    if (dateTime != null) {
                      setState(() {
                        selectedDate = dateTime;
                      });
                    }
                  },
                  child: const Text('Select Birthday'),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'How tall are you?',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: heightController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                    ),
                    decoration: InputDecoration(suffixText: 'cm'),
                    style: TextStyle(fontSize: TextSizing.medium),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'How much do you weigh?',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(suffixText: 'kg'),
                    style: TextStyle(fontSize: TextSizing.medium),
                  ),
                ),
              ],
            ),

            struggle(), //? What do you struggle most with: daily schedule change or a weekly change?

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

            if (obligationVisibility) getWeek(),
            ElevatedButton(
              onPressed: isSaving ? null : handleFinished,
              child: isSaving
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Finished'),
            ),

            // What do you hope to achieve with IF?

            // What is your preferred flexibility in your IF schedule?
          ],
        ),
      ),
    );
  }

  Future<void> handleFinished() async {
    setState(() => isSaving = true);
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
      );
      ObligationMeals temp = ObligationMeals(tempDays, obligationTimes);
      RecommendationSystem rs = RecommendationSystem(
        prevForms: selectedForms,
        prevDuration: int.parse(durationController.text),
        struggle: selectedStruggle,
        meals: temp,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              FinalSetup(almost: tempUser, obligations: temp, rs: rs),
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
            child: const Text('+',
                    style: TextStyle(fontSize: TextSizing.large),),
          ),
      ],
    );
  }

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
            style: TextStyle(fontSize: TextSizing.medium),
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
        children: [
          const Text(
            'What form(s) of intermittent fasting have you done before?',
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
          ),
          const Text('For what duration?'),
          TextField(
            controller: durationController,
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            decoration: InputDecoration(suffixText: 'weeks'),
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
        children: [
          const Text('What do you struggle more with?',
                    style: TextStyle(fontSize: TextSizing.medium),),
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

  Widget buildQuestion(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(title),
          RadioGroup<Measurement>(
            groupValue: measurement,
            onChanged: (Measurement? value) {
              setState(() {
                measurement = value;
              });
            },
            child: Row(
              children: [
                SizedBox(width: 30),
                Text('Metric'),
                Radio<Measurement>(value: Measurement.metric),
                const SizedBox(width: 12),
                Text('Imperial'),
                Radio<Measurement>(value: Measurement.imperial),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class SetupUser extends ConsumerStatefulWidget {
//   const SetupUser({super.key});

//   @override
//   ConsumerState<SetupUser> createState() => _SetupUserState();
// }

// enum Measurement { metric, imperial }

// List<bool> daysSelected = List.filled(7, false);

// class _SetupUserState extends ConsumerState<SetupUser> {
//   static final List<DropdownMenuEntry<String>> entries =
//       UnmodifiableListView<DropdownMenuEntry<String>>(
//         list.map<DropdownMenuEntry<String>>(
//           (String name) => DropdownMenuEntry(value: name, label: name),
//         ),
//       );
//   String dropDownValue = 'TRE';
//   Measurement? measurement = Measurement.metric;
//   DateTime selectedDate = DateTime(2008);
//   // bool? measurement = false;

//   bool obligationVisibility = false;
//   List<bool> obligationDays = List.filled(7, false);

//   @override
//   Widget build(BuildContext context) {

//     // ref.watch(uDaoProvider).addUser('Deanna', true, FastingForm.tre, 'Beginner', start, end, '1,3,5', '2,4,6');
//     //! This adds info from previous page
//     int initialVal = 0;
//     final weightContorller = TextEditingController(text: initialVal.toString());
//     final heightContorller = TextEditingController(text: initialVal.toString());
//     return Scaffold(
//       appBar: AppBar(title: Text('Beginner'), centerTitle: true),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text(
//               'Forms of Intermittent Fasting',
//               style: TextStyle(fontWeight: FontWeight.bold),
//               textAlign: TextAlign.left,
//             ),
//             buildTextCard(
//               'Time Restricted Eating',
//               'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
//             ),
//             buildTextCard(
//               'Alternate Day Fasting',
//               'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
//             ),
//             buildTextCard(
//               'Modified Fasting/5:2',
//               'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
//             ),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //   children: [
//             //     const Text(
//             //       'Plan',
//             //       style: TextStyle(fontSize: TextSizing.large),
//             //     ),
//             //     DropdownMenu<String>(
//             //       initialSelection: dropDownValue,
//             //       // side
//             //       // menuStyle: MenuStyle(),
//             //       onSelected: (String? value) {
//             //         setState(() {
//             //           dropDownValue = value!;
//             //           //! Figure out when/how to update the fasting form in the table
//             //           // ref.read(uDaoProvider).changeFormIF(session.userId, formConverter.fromSql(dropDownValue), start, end, days)
//             //         });
//             //       },
//             //       dropdownMenuEntries: entries,
//             //       textStyle: TextStyle(fontSize: TextSizing.large),
//             //     ),
//             //   ],
//             // ),
//             Text('Questions', style: TextStyle(fontWeight: FontWeight.bold)),
//             buildQuestion('Do you prefer metric or imperial?'),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //   children: List.generate(4, (c) => getBox(c, daysSelected)),
//             // ),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //   children: List.generate(3, (c) => getBox(c + 4, daysSelected)),
//             // ),
//             ElevatedButton(
//               onPressed: () async {
//                 final DateTime? dateTime = await showDatePicker(
//                   context: context,
//                   initialDate: selectedDate,
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(3000),
//                 );
//                 if (dateTime != null) {
//                   setState(() {
//                     selectedDate = dateTime;
//                   });
//                 }
//               },
//               child: const Text('Select Birthday'),
//             ),
//             const Text('How tall are you?'),
//             TextField(
//               controller: heightContorller,
//               keyboardType: TextInputType.numberWithOptions(decimal: false),
//               decoration: InputDecoration(suffixText: 'cm'),
//             ),
//             const Text('How much do you weigh?'),
//             TextField(
//               controller: weightContorller,
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               decoration: InputDecoration(suffixText: 'kg'),
//             ),
//             const Text('Do you eat meals with family or friends regularly?'),
//             Checkbox(
//               value: obligationVisibility,
//               onChanged: (value) {
//                 setState(() => obligationVisibility = value ?? false);
//               },
//             ),
//             if (obligationVisibility) getWeek(),
//               //? Create and push through a provider with all the input? Or just create the UserSessionProvider with the data and add the user before going to the next page?
//               ElevatedButton(
//                 onPressed: () {
//                   // final uDao = ref.watch(uDaoProvider);
//                   // uDao.addUser('Temp', measurement == Measurement.metric ? true : false, FastingFormConverter.fromSql(dropDownValue), exp, start, end, days52, daysADF);
//                   Navigator.pushNamed(context, '/FinalSetup');
//                 },
//                 child: Text('Finished'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Column getWeek() {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: List.generate(4, (c) => getBox(c, obligationDays)),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: List.generate(3, (c) => getBox(c + 4, obligationDays)),
//           ),
//         ),
//         const Text('Which meals are reserved for these obligations?'),
//         getObligationMeal(),
//         // Want to be able to have multiple of these
//       ],
//     );
//   }

//   // List<String> mealOptions = ['Breakfast', 'Lunch', 'Supper', 'Snack'];
//   //   static final List<DropdownMenuEntry<String>> mealEntries =
//   //     UnmodifiableListView<DropdownMenuEntry<String>>(
//   //       list.map<DropdownMenuEntry<String>>(
//   //         (String name) => DropdownMenuEntry(value: name, label: name),
//   //       ),
//   //     );
//   int mealCap = 3;
//   String mealOneText = '+', mealTwoText = '+', mealThreeText = '+';

//   Row getObligationMeal() {
//     return .new(children: [
//       ElevatedButton(onPressed: selectMealTime, child: Text(mealOneText)),
//       // Want a max of three of these, which can be added/removed with a button push
//     ]);
//   }

//   Future<void> selectMealTime() async {
//     final time = await Dialogs.showTimeInput(context);
//     if (time != null) {
//       setState(() {
//         mealOneText = time.format(context);
//         // switch (index) {
//         //   case 1: mealOneText = time.format(context);
//         //   case 2: mealTwoText = time.format(context);
//         //   case 3: mealThreeText = time.format(context);
//         // }
//       });
//     }
//   }

//   CustomCheckbox getBox(int index, List<bool> curList) => .new(
//     isSelected: curList[index],
//     dayOfWeek: daysOfWeek[index],
//     onTap: (bool val) {
//       setState(() {
//         curList[index] = val;
//       });
//     },
//   );

//   Widget buildTextCard(String title, text) {
//     return Padding(
//       padding: EdgeInsets.all(10),
//       child: Card(
//         child: ExpansionTile(
//           title: Text(
//             title,
//             textAlign: TextAlign.left,
//             style: TextStyle(fontSize: TextSizing.medium),
//           ),
//           children: [Text(text, style: TextStyle(fontSize: TextSizing.medium))],
//         ),
//       ),
//     );
//   }

//   Widget buildQuestion(String title) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       child: Column(
//         children: [
//           Text(title),
//           RadioGroup<Measurement>(
//             groupValue: measurement,
//             onChanged: (Measurement? value) {
//               setState(() {
//                 measurement = value;
//               });
//             },
//             child: Row(
//               children: [
//                 SizedBox(width: 30),
//                 Text('Metric'),
//                 Radio<Measurement>(value: Measurement.metric),
//                 const SizedBox(width: 12),
//                 Text('Imperial'),
//                 Radio<Measurement>(value: Measurement.imperial),
//                 // ListTile(
//                 //   title: Text("Imperial"),
//                 //   leading: Radio<Measurement>(value: Measurement.imperial),
//                 // )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
