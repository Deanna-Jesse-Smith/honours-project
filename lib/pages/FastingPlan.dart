import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:testrun/utils/text_sizing.dart';

class FastingPlan extends StatefulWidget {
  const FastingPlan({super.key});
  @override
  State<FastingPlan> createState() => FastingPlanState();
}

const List<String> list = <String>['ADF', 'TRE', '5:2'];

class FastingPlanState extends State<FastingPlan> {
  static final List<DropdownMenuEntry<String>> entries =
      UnmodifiableListView<DropdownMenuEntry<String>>(
        list.map<DropdownMenuEntry<String>>(
          (String name) => DropdownMenuEntry(value: name, label: name),
        ),
      );
  String dropDownValue = list.first;

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: customWidgets.appBar('Fasting Plan'),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Plan', style: TextStyle(fontSize: TextSizing.large)),
                  DropdownMenu<String>(
                    initialSelection: list.first,
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
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.amber
                        : const Color.fromARGB(255, 203, 184, 255),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Text(
                    'M',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: TextSizing.large),
                  ),
                ),
                onTap: () {
                  isSelected = !isSelected;
                },
              ),
            ),
          ],
        ),
      ),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(1),
    );
  }
}
