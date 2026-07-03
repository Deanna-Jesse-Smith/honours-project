import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import 'package:testrun/custom_widgets.dart';
import 'package:testrun/database/converters.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/main.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/custom_checkbox.dart';
import 'package:testrun/widgets/main_app_bar.dart';

class FastingPlan extends StatefulWidget {

  const FastingPlan({super.key});
  @override
  State<FastingPlan> createState() => FastingPlanState();
}

const List<String> list = <String>['ADF', 'TRE', '5:2'];
List<bool> daysSelected = List.filled(7, false);

class FastingPlanState extends State<FastingPlan> {
  static final List<DropdownMenuEntry<String>> entries =
      UnmodifiableListView<DropdownMenuEntry<String>>(
        list.map<DropdownMenuEntry<String>>(
          (String name) => DropdownMenuEntry(value: name, label: name),
        ),
      );
  String dropDownValue = userState.fastingForm.value.name;

  @override
  Widget build(BuildContext context) {
   FastingDao  fDao = getIt<FastingDao>();
    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: MainAppBar.appBar('Fasting Plan'),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: getCorrectLayout(),
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
        1,
        posi: ExpandableFabPos.right,
      ),
    );
  }

  Column getCorrectLayout() {
    if (dropDownValue == 'ADF') {
      return createADF();
    } else if (dropDownValue == 'TRE') {
      return createTRE();
    } else {
      return create52();
    }
  }

  Column create52() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(15), child: chooseFastingPlan()),
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCheckbox(
                isSelected: daysSelected[0],
                dayOfWeek: 'M',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[0] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[1],
                dayOfWeek: 'Tu',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[1] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[2],
                dayOfWeek: 'W',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[2] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[3],
                dayOfWeek: 'Th',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[3] = val;
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
                isSelected: daysSelected[4],
                dayOfWeek: 'F',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[4] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[5],
                dayOfWeek: 'Sat',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[5] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[6],
                dayOfWeek: 'Sun',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[6] = val;
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

  Column createTRE() {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(15), child: chooseFastingPlan()),
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

  Column createADF() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(15), child: chooseFastingPlan()),
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
                isSelected: daysSelected[0],
                dayOfWeek: 'M',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[0] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[1],
                dayOfWeek: 'Tu',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[1] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[2],
                dayOfWeek: 'W',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[2] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[3],
                dayOfWeek: 'Th',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[3] = val;
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
                isSelected: daysSelected[4],
                dayOfWeek: 'F',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[4] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[5],
                dayOfWeek: 'Sat',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[5] = val;
                  });
                },
              ),
              CustomCheckbox(
                isSelected: daysSelected[6],
                dayOfWeek: 'Sun',
                onTap: (bool val) {
                  setState(() {
                    daysSelected[6] = val;
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

  Row chooseFastingPlan() {
    FastingFormConverter formConverter = FastingFormConverter();
    return .new(
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
              userState.fastingForm.value = formConverter.fromSql(dropDownValue);
            });
          },
          dropdownMenuEntries: entries,
          textStyle: TextStyle(fontSize: TextSizing.large),
        ),
      ],
    );
  }

    Row chooseFastingPlann() {
      final plan = userState.fastingForm.value.name;
    return .new(
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
    );
  }
}
