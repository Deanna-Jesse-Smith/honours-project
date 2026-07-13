import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:testrun/custom_widgets.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/custom_checkbox.dart';
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

  @override
  void initState() {
    final session = ref.watch(userSessionProvider).value;
   dropDownValue = session!.fastingForm.name;
   debugPrint('The value is: $dropDownValue');
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
      floatingActionButton: customWidgets.getFAB(ref, session,
        1,
        posi: ExpandableFabPos.right,
      ),
    );
  }

  // late TextEditingController controller;

  // @override
  // void initState() {
  //   super.initState();

  //   controller = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();

  //   super.dispose();
  // }

  //   Future<String?> openDialog(BuildContext context) => showDialog<String?>(  // final thing = await openDialog();
  //   context: context, 
  //   builder: (context) => AlertDialog(
  //     title: Text('Title'),
  //     content: TextField(
  //       keyboardType: TextInputType.number        ,
  //       decoration: InputDecoration(hintText: 'Spinner'), 
  //       controller: controller,
  //       onSubmitted: (_) => closed(),
  //       ),
  //     actions: [
  //       TextButton(onPressed: closed, child: Text('Press'))
  //       // WheelPicker(
  //       //   builder: (context, index) => Text('$index'),

  //       //   )
  //     ],
  //   )
  //   );

  //   void closed() {
  //     Navigator.of(context).pop(controller.text);

  //     controller.clear();
  //   }

  Column getCorrectLayout(UserSessionData session) {
    if (dropDownValue.toLowerCase() == 'adf') {
      return createADF(session);
    } else if (dropDownValue.toLowerCase() == 'tre') {
      return createTRE(session);
    } else {
      return create52(session);
    }
  }

  List<bool> convertDaysSelected(List<int> days, List<bool> list) {
    list.fillRange(0, 6, false);
    for (int day in days) {
      list[day] = true;
    }
    return list;
  }

  Column create52(UserSessionData session) {
    fiveTwoDaysSelected = convertDaysSelected(session.fiveTwoDaysSelected, fiveTwoDaysSelected);
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(15), child: chooseFastingPlan(session)),
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCheckbox(
                isSelected: fiveTwoDaysSelected[0],
                dayOfWeek: 'M',
                onTap: (bool val) {
                  setState(() {
                    fiveTwoDaysSelected[0] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: fiveTwoDaysSelected[1],
                dayOfWeek: 'Tu',
                onTap: (bool val) {
                  setState(() {
                    fiveTwoDaysSelected[1] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: fiveTwoDaysSelected[2],
                dayOfWeek: 'W',
                onTap: (bool val) {
                  setState(() {
                    fiveTwoDaysSelected[2] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: fiveTwoDaysSelected[3],
                dayOfWeek: 'Th',
                onTap: (bool val) {
                  setState(() {
                    fiveTwoDaysSelected[3] = val;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCheckbox(
                isSelected: fiveTwoDaysSelected[4],
                dayOfWeek: 'F',
                onTap: (bool val) {
                  setState(() {
                    fiveTwoDaysSelected[4] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: fiveTwoDaysSelected[5],
                dayOfWeek: 'Sat',
                onTap: (bool val) {
                  setState(() {
                    fiveTwoDaysSelected[5] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: fiveTwoDaysSelected[6],
                dayOfWeek: 'Sun',
                onTap: (bool val) {
                  setState(() {
                    fiveTwoDaysSelected[6] = val;
                  });
                },
              ),
            ],
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
  }

  Column createTRE(UserSessionData session) {
    final theme = Theme.of(context);
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

  Column createADF(UserSessionData session) {
    adfDaysSelected = convertDaysSelected(session.adfDaysSelected, adfDaysSelected);
    return Column(
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
            children: [
              CustomCheckbox(
                isSelected: adfDaysSelected[0],
                dayOfWeek: 'M',
                onTap: (bool val) {
                  setState(() {
                    adfDaysSelected[0] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: adfDaysSelected[1],
                dayOfWeek: 'Tu',
                onTap: (bool val) {
                  setState(() {
                    adfDaysSelected[1] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: adfDaysSelected[2],
                dayOfWeek: 'W',
                onTap: (bool val) {
                  setState(() {
                    adfDaysSelected[2] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: adfDaysSelected[3],
                dayOfWeek: 'Th',
                onTap: (bool val) {
                  setState(() {
                    adfDaysSelected[3] = val;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(35, 15, 35, 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCheckbox(
                isSelected: adfDaysSelected[4],
                dayOfWeek: 'F',
                onTap: (bool val) {
                  setState(() {
                    adfDaysSelected[4] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: adfDaysSelected[5],
                dayOfWeek: 'Sat',
                onTap: (bool val) {
                  setState(() {
                    adfDaysSelected[5] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: adfDaysSelected[6],
                dayOfWeek: 'Sun',
                onTap: (bool val) {
                  setState(() {
                    adfDaysSelected[6] = val;
                  });
                },
              ),
            ],
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
  }

  Padding selectFastingPlan() {
    return .new(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Plan', style: TextStyle(fontSize: TextSizing.large)),
          DropdownMenu<String>(
            initialSelection: list.first,
            // side
            // menuStyle: MenuStyle(),
            onSelected: (String? value) {
              setState(() {
                dropDownValue = value!;
              });
            },
            dropdownMenuEntries: entries,
            textStyle: TextStyle(fontSize: TextSizing.large),
          ),
        ],
      ),
    );
  }

  Row chooseFastingPlan(UserSessionData session) {
    FastingFormConverter formConverter = FastingFormConverter();
    return .new(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('Plan', style: TextStyle(fontSize: TextSizing.large)),
        DropdownMenu<String>(
          initialSelection: dropDownValue,
          // side
          // menuStyle: MenuStyle(),
          onSelected: (String? value) {
            setState(() {
              dropDownValue = value!;
              debugPrint('The user selected: $value');
              // session.fastingForm = formConverter.fromSql(dropDownValue);
              //! Figure out when/how to update the fasting form in the table
            });
          },
          dropdownMenuEntries: entries,
          textStyle: TextStyle(fontSize: TextSizing.large),
        ),
      ],
    );
  }
}
