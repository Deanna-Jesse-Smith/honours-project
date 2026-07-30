import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:testrun/custom_widgets.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/custom_checkbox.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/main_app_bar.dart';

class FastingPlan extends ConsumerStatefulWidget {
  const FastingPlan({super.key});
  @override
  ConsumerState<FastingPlan> createState() => FastingPlanState();
}

const List<String> list = <String>['adf', 'tre', 'fiveTwo'];
List<bool> adfDaysSelected = List.filled(7, false);
List<bool> fiveTwoDaysSelected = List.filled(7, false);

class FastingPlanState extends ConsumerState<FastingPlan> {
  static final List<DropdownMenuEntry<String>> entries =
      UnmodifiableListView<DropdownMenuEntry<String>>(
        list.map<DropdownMenuEntry<String>>(
          (String name) => DropdownMenuEntry(value: name, label: name),
        ),
      );
  late String dropDownValue;
  late FastingGoalModel? curGoal;

  static final List<DropdownMenuEntry<FastingForm>> entriess =
      UnmodifiableListView<DropdownMenuEntry<FastingForm>>(
        FastingForm.values.map<DropdownMenuEntry<FastingForm>>(
          (FastingForm form) =>
              DropdownMenuEntry(value: form, label: form.label),
        ),
      );
  late FastingForm dropDownValuee;
  TimeOfDay start = TimeOfDay(hour: 0, minute: 0), end = TimeOfDay(hour: 0, minute: 0);

  @override
  void initState() async {
    final session = ref.watch(userSessionProvider).value;
    dropDownValue = session!.fastingForm.name;
    dropDownValuee = session.fastingForm;
    debugPrint('The value is: $dropDownValue');

    fiveTwoDaysSelected = intsToBools(
      session.fiveTwoDaysSelected,
      fiveTwoDaysSelected,
    );
    adfDaysSelected = intsToBools(session.adfDaysSelected, adfDaysSelected);

    curGoal = await ref.watch(gDaoProvider).findActiveFastingGoal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(userSessionProvider).value;
    CustomWidgets customWidgets = CustomWidgets();

    return Scaffold(
      appBar: MainAppBar.appBar('Fasting Plan', session!.userName),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: getCorrectLayout(session),
      ),
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 15, bottom: 20),
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FastingHistory()),
              ),
            },
            child: Text(
              'View Fasting History',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ),
      ],
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(
        ref,
        context,
        1,
        posi: ExpandableFabPos.right,
      ),
    );
  }

  Column getCorrectLayout(UserSessionData session) {
    // if (dropDownValuee == FastingForm.adf) {
    //   return createADF(session);
    // } else if (dropDownValuee == FastingForm.tre) {
    //   return createTRE(session);
    // } else {
    //   return create52(session);
    // }

    if (dropDownValue.toLowerCase() == 'adf') {
      return createADF(session);
    } else if (dropDownValue.toLowerCase() == 'tre') {
      return createTRE(session);
    } else {
      return create52(session);
    }
  }

  List<bool> intsToBools(List<int> days, List<bool> list) {
    list.fillRange(0, 6, false);
    for (int day in days) {
      list[day] = true;
    }
    return list;
  }

  List<int> boolsToInts(List<bool> days) => [
    for (int loop = 0; loop < days.length; loop++)
      if (days[loop]) loop,
  ];

  CustomCheckbox getBox(int index, List<bool> curList) => .new(
    isSelected: curList[index],
    dayOfWeek: daysOfWeek[index],
    onTap: (bool val) {
      setState(() {
        curList[index] = val;
      });
    },
  );

  Column create52(UserSessionData session) => Column(
    children: [
      Padding(padding: EdgeInsets.all(15), child: chooseFastingPlan(session)),
      Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Select Fasting Days',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (c) => getBox(c, fiveTwoDaysSelected)),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (c) => getBox(c + 4, fiveTwoDaysSelected)),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: const Text(
          'Encouragement Text',
          style: TextStyle(fontSize: TextSizing.large),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: const Text(
          'Streak progress text',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: CustomWidgets().streakIndicator(
          'Streak underway',
          0.6,
          Colors.orange,
          Colors.amberAccent,
          context,
        ),
      ),
    ],
  );

  String startText = 'Start', endText = 'End';

  Future<void> selectStartTime() async {
    final time = await Dialogs.showTimeInput(context);
    if (time != null) {
      setState(() {
        start = time;
        startText = time.format(context);
      });
    }
  }

  Future<void> selectEndTime() async {
    final time = await Dialogs.showTimeInput(context);
    if (time != null) {
      setState(() {
        end = time;
        endText = time.format(context);
      });
    }
  }

  Column createTRE(UserSessionData session) {
    final theme = Theme.of(context);
    List<String> headings = ['Starting Time', 'Ending Time'];
    List<ElevatedButton> times = [
      ElevatedButton(onPressed: selectStartTime, child: Text(startText)),
      ElevatedButton(onPressed: selectEndTime, child: Text(endText)),
    ];

    return Column(
      children: [
        Padding(padding: EdgeInsets.all(15), child: chooseFastingPlan(session)),
        Padding(
          padding: EdgeInsets.all(15),
          child: const Text(
            'Encouragement Text',
            style: TextStyle(fontSize: TextSizing.large),
          ),
        ),
        Table(
          children: [
            TableRow(
              children: headings
                  .map((heading) => Center(child: Text(heading)))
                  .toList(),
            ),
            TableRow(
              children: times.map((times) => Center(child: times)).toList(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Streak progress text',
            style: theme.textTheme.displayMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: CustomWidgets().streakIndicator(
            'Streak underway',
            0.6,
            Colors.orange,
            Colors.amberAccent,
            context,
          ),
        ),
      ],
    );
  }

  Column createADF(UserSessionData session) => Column(
    children: [
      Padding(padding: EdgeInsets.all(15), child: chooseFastingPlan(session)),
      Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Select Fasting Days',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (c) => getBox(c, adfDaysSelected)),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(35, 15, 35, 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (c) => getBox(c + 4, adfDaysSelected)),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: const Text(
          'Encouragement Text',
          style: TextStyle(fontSize: TextSizing.large),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: const Text(
          'Streak progress text',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: CustomWidgets().streakIndicator(
          'Streak underway',
          0.6,
          Colors.orange,
          Colors.amberAccent,
          context,
        ),
      ),
    ],
  );

  Row chooseFastingPlan(UserSessionData session) => .new(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text('Plan', style: TextStyle(fontSize: TextSizing.large)),
      DropdownMenu<FastingForm>(
        initialSelection: dropDownValuee,
        // side
        // menuStyle: MenuStyle(),
        onSelected: (FastingForm? value) {
          setState(() async {
            bool decision = true;

            if (value! != session.fastingForm && curGoal != null) {
              decision = await Dialogs.dangerDialog(context, title: 'Are you sure?', message: 'Changing your fasting form will wipe your current fasting goal and/or streak.');
            }
            //! Figure out when/how to update the fasting form in the table
            if (decision) {
              dropDownValuee = value!;
              debugPrint('The user selected: $value');
              DateTime temp = DateTime.now();
              DateTime startDate = DateTime(temp.year, temp.month, temp.day, start.hour, start.minute);
              DateTime endDate = DateTime(temp.year, temp.month, temp.day, end.hour, end.minute);
              ref.read(uDaoProvider).changeFormIF(session.userId, dropDownValuee, startDate, endDate, days);
            }
            // ref.read(uDaoProvider).changeFormIF(session.userId, formConverter.fromSql(dropDownValue), start, end, days)
          });
        },
        dropdownMenuEntries: entriess,
        textStyle: TextStyle(fontSize: TextSizing.large),
      ),
      // DropdownMenu<String>(
      //   initialSelection: dropDownValue,
      //   // side
      //   // menuStyle: MenuStyle(),
      //   onSelected: (String? value) {
      //     setState(() {
      //       dropDownValue = value!;
      //       debugPrint('The user selected: $value');
      //       //! Figure out when/how to update the fasting form in the table
      //       // ref.read(uDaoProvider).changeFormIF(session.userId, formConverter.fromSql(dropDownValue), start, end, days)
      //     });
      //   },
      //   dropdownMenuEntries: entries,
      //   textStyle: TextStyle(fontSize: TextSizing.large),
      // ),
    ],
  );
}
