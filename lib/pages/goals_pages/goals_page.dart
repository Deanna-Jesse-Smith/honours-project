import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';

class GoalsPage extends ConsumerStatefulWidget {
  final GoalType type;
  const GoalsPage({super.key, required this.type});

  @override
  ConsumerState<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends ConsumerState<GoalsPage> {
  late GoalType type;
  late String title;
  late BasicGoal curGoal;
  late Future<BasicStreak?> curStreak;
  final TextEditingController goalController = TextEditingController(text: '0');
  bool isLogOnly = true;

  static final List<DropdownMenuEntry<GoalOperator>> entries =
      UnmodifiableListView<DropdownMenuEntry<GoalOperator>>(
        GoalOperator.values.map<DropdownMenuEntry<GoalOperator>>(
          (GoalOperator op) => DropdownMenuEntry(value: op, label: op.symbol),
        ),
      );
  GoalOperator curGoalOperator = GoalOperator.greaterThan;

  @override
  void initState() {
    type = widget.type;

    initFutures();

    super.initState();
  }

  void initFutures() async {
    curStreak = ref.watch(gDaoProvider).checkActiveStreak(type);
  }

  @override
  Widget build(BuildContext context) {
    final logic = AsyncGoals();
    return Scaffold(
      appBar: AppBar(
        title: Text(type.forDisplay, style: TextStyle(fontSize: TextSizing.large)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () async {
            final decision = await Dialogs.dangerDialog(
              context,
              title: type.forDisplay,
              message:
                  'Leaving without saving will discard any changes you made',
            );
            if (!context.mounted) return;
            if (decision) {
              Navigator.of(context).pop();
            }
          },
        ),
        actions: [
          Tooltip(
            message: '',
            triggerMode: TooltipTriggerMode.tap,
            child: IconButton(
              onPressed: () => Dialogs.getFastResultHelp(context),
              icon: Icon(Icons.question_mark),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Current Goal: '),
            goalInfo()
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            //! Save dialogue and actions here
            

            Navigator.of(context).pop();
          },
          child: const Text('Save Changes'),
        ),
      ],
    );
  }

  FutureBuilder goalInfo() {
    return FutureBuilder(
      future: ref.watch(gDaoProvider).findActiveGoal(type),
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return Text('Add Goal?');
        }

        BasicGoal? goal = asyncSnapshot.data;

        if (goal == null) {
          return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text(type.goalText),
                  Table(
                    children: [
                      TableRow(
                        children: [Text('Comparison: '), goalOperatorMenu()],
                      ),
                      TableRow(
                        children: [
                          Text('Amount: '),
                          TextField(
                            controller: goalController,
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
        }

        goalController.text = goal.threshold.toString();

        switch (goal) {
          case FastingGoalModel model:
          curGoal = model;

          final session = ref.watch(userSessionProvider).value;
          String goalText = '';

          switch (session!.fastingForm) {
            case FastingForm.tre:
              goalText = 'Hours of fasting per day.';
            case FastingForm.fiveTwo:
              goalText = 'Meals per fasting day.';
            case FastingForm.adf:
              goalText = 'Days of fasting a week.';
          } 

          return goalCard(TextInputType.numberWithOptions(), goalText);
          case WeightGoalModel model:
            curGoal = model;
            return goalCard(TextInputType.numberWithOptions(decimal: true), 'As my goal', suffixText: 'kg');
          case HydrationGoalModel model:
            curGoal = model;
            return goalCard(TextInputType.numberWithOptions(decimal: true), 'litres of water per day', suffixText: 'Litres');
          case NutritionGoalModel model:
            curGoal = model;
            return goalCard(TextInputType.numberWithOptions(), 'Meal(s) per day');
          case BasicStreak():
            // TODO: Handle this case.
            throw UnimplementedError();
        }
      },
    );
  }

  Card goalCard(TextInputType inputType, String goalText, {String suffixText = ''}) {
    return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text(type.goalText),
                  Table(
                    children: [
                      TableRow(
                        children: [Text('Comparison: '), goalOperatorMenu()],
                      ),
                      TableRow(
                        children: [
                          Text('Amount: '),
                          TextField(
                            controller: goalController,
                            keyboardType: inputType,
                            decoration: InputDecoration(suffix: Text(suffixText)),
                            onChanged: (value) => setState(() {
                              double? temp = double.tryParse(value);

                              if (temp != null) curGoal.threshold = temp;
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(goalText),
                ],
              ),
            );
  }

  FutureBuilder streakInfo() {
    return FutureBuilder(
      future: curStreak,
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return Text('Add Streak?');
        }
        BasicStreak? streak = asyncSnapshot.data;

        if (streak == null) {
          if (widget.type == GoalType.weight) {
            return Text('You cannot have a weight streak, only a weight goal.');
          }
          return Text('Add Streak?');
        }

        return Card(
          child: Column(
            children: [
              CheckboxListTile(
                value: isLogOnly,
                onChanged: (bool? value) {
                  setState(() {
                    isLogOnly = value!;
                  });
                },
                title: Text('Track Logs only'),
              ), //! make this only editable on streak creation
              Text('Days on Streak: ${streak.daysProgress}'),
              Text('Started on: ${DateFormat.yMEd().format(streak.start)}'),
            ],
          ),
        );

        // switch (streak) {
        //   case FastingStreak streak:
        //     throw UnimplementedError();
        //   case WeightStreak streak:
        //     // TODO: Handle this case.
        //     throw UnimplementedError();
        //   case HydrationStreak streak:
        //     return Card(
        //       child: Column(
        //         children: [
        //           CheckboxListTile(value: isLogOnly, onChanged: (bool? value) {
        //             setState(() {
        //               isLogOnly = value!;
        //             });
        //           },
        //           title: Text('Track Logs only')), //! make this only editable on streak creation
        //           Text('Days on Streak: ${streak.daysProgress}'),
        //           Text('Started on: ${DateFormat.yMEd().format(streak.start)}'),
        //         ],
        //       )
        //     );
        //   case NutritionStreak streak:
        //     // TODO: Handle this case.
        //     throw UnimplementedError();
        //   case BasicStreak streak:
        //     // TODO: Handle this case.
        //     throw UnimplementedError();
        // }
      },
    );
  }

  DropdownMenu<GoalOperator> goalOperatorMenu() {
    return DropdownMenu<GoalOperator>(
      dropdownMenuEntries: entries,
      onSelected: (GoalOperator? value) {
        setState(() {
          curGoalOperator = value!;
        });
      },
      textStyle: TextStyle(fontSize: TextSizing.small),
    );
  }
}
