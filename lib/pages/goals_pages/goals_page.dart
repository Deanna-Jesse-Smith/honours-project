import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
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
  late Future curGoal;
  late Future<BasicStreak?> curStreak;
  final TextEditingController fastingController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController intInputController = TextEditingController(
    text: '0',
  );
  final TextEditingController calorieController = TextEditingController(
    text: '0',
  );
  final TextEditingController carbController = TextEditingController(text: '0');
  final TextEditingController proteinController = TextEditingController(
    text: '0',
  );
  final TextEditingController fatController = TextEditingController(text: '0');
  final TextEditingController fibreController = TextEditingController(
    text: '0',
  );
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

    switch (type) {
      case GoalType.fasting:
        title = 'Fasting Goals';
      case GoalType.weight:
        title = 'Weight Goals';
      case GoalType.hydration:
        title = 'Hydration Goals';
      case GoalType.nutrition:
        title = 'Nutrition Goals';
    }

    initFutures();

    super.initState();
  }

  void initFutures() async {
    //TODO  Figure out how to do the nutrient one later

    curGoal = await ref.watch(gDaoProvider).findActiveGoal(type);
    curStreak = await ref.watch(gDaoProvider).checkActiveStreak(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontSize: TextSizing.large)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () async {
            final decision = await Dialogs.dangerDialog(
              context,
              title: title,
              message:
                  'Leaving without saving will discard any changes you made',
            );
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
          children: [Text('Current Goal: ')],
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

  FutureBuilder goalInformation() {
    return FutureBuilder(
      future: curGoal,
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return Text('Add Goal?');
        }
        if (asyncSnapshot.data == null) {
          return Text('Add Goal?');
        } 

        switch (type) {
          case GoalType.fasting:
            FastingGoalModel model = asyncSnapshot.data;
            final session = ref.watch(userSessionProvider).value;

            return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text('I will reach my fasting goal of:'),
                  Table(
                    children: [
                      TableRow(
                        children: [Text('Comparison: '), goalOperatorMenu()],
                      ),
                      TableRow(
                        children: [
                          if (model.targetCalories != null)
                            Text('${model.targetCalories}'),
                          if (model.targetDays != null)
                            Text('${model.targetDays}'),
                          if (model.targetHours != null)
                            Text('${model.targetHours}'),
                          TextField(
                            controller: fastingController,
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (model.targetCalories != null)
                    Text('Calories per fasting day.'),
                  if (model.targetDays != null) Text('Days of fasting a week.'),
                  if (model.targetHours != null)
                    Text('Hours of fasting per day.'),
                ],
              ),
            );
          case GoalType.weight:
            WeightGoalModel model = asyncSnapshot.data;
            weightController.text = model.targetWeight.toString();
            return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text('I will weigh:'),
                  Table(
                    children: [
                      TableRow(
                        children: [Text('Comparison: '), goalOperatorMenu()],
                      ),
                      TableRow(
                        children: [
                          Text('Amount: '),
                          TextField(
                            controller: intInputController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'kg'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          case GoalType.hydration:
            HydrationGoalModel model = asyncSnapshot.data;
            intInputController.text = model.hdrAmount.toString();
            return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text('I will drink:'),
                  Table(
                    children: [
                      TableRow(
                        children: [Text('Comparison: '), goalOperatorMenu()],
                      ),
                      TableRow(
                        children: [
                          Text('Amount: '),
                          TextField(
                            controller: intInputController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'litres'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('litres of water per day'),
                ],
              ),
            );
          case GoalType.nutrition:
            List<NutritionGoalModel> models = asyncSnapshot.data;
            return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text('I will reach my goal of (per day):'),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Text('Carbohydrate amount (g): '),
                          goalOperatorMenu(),
                          TextField(
                            controller: carbController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'g'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Calorie amount: '),
                          goalOperatorMenu(),
                          TextField(
                            controller: calorieController,
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Fat amount (g): '),
                          goalOperatorMenu(),
                          TextField(
                            controller: fatController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'g'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Fibre amount (g): '),
                          goalOperatorMenu(),
                          TextField(
                            controller: carbController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'g'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Protein amount (g): '),
                          goalOperatorMenu(),
                          TextField(
                            controller: carbController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'g'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('litres of water per day'),
                ],
              ),
            );
        }
      },
    );
  }

  FutureBuilder goalInfo() {
    return FutureBuilder(
      future: curGoal,
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return Text('Add Goal?');
        }

        BasicGoal? goal = asyncSnapshot.data;

        if (goal == null) {
          return Text('Add Goal?');
        }

        switch (goal) {
          case FastingGoalModel model:
            final session = ref.watch(userSessionProvider).value;

            return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text('I will reach my fasting goal of:'),
                  Table(
                    children: [
                      TableRow(
                        children: [Text('Comparison: '), goalOperatorMenu()],
                      ),
                      TableRow(
                        children: [
                          if (model.targetCalories != null)
                            Text('${model.targetCalories}'),
                          if (model.targetDays != null)
                            Text('${model.targetDays}'),
                          if (model.targetHours != null)
                            Text('${model.targetHours}'),
                          TextField(
                            controller: fastingController,
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (model.targetCalories != null)
                    Text('Calories per fasting day.'),
                  if (model.targetDays != null) Text('Days of fasting a week.'),
                  if (model.targetHours != null)
                    Text('Hours of fasting per day.'),
                ],
              ),
            );
          case WeightGoalModel model:
            weightController.text = model.targetWeight.toString();
            return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text('I will weigh:'),
                  Table(
                    children: [
                      TableRow(
                        children: [Text('Comparison: '), goalOperatorMenu()],
                      ),
                      TableRow(
                        children: [
                          Text('Amount: '),
                          TextField(
                            controller: intInputController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'kg'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          case HydrationGoalModel model:
            intInputController.text = model.hdrAmount.toString();
            return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text('I will drink:'),
                  Table(
                    children: [
                      TableRow(
                        children: [Text('Comparison: '), goalOperatorMenu()],
                      ),
                      TableRow(
                        children: [
                          Text('Amount: '),
                          TextField(
                            controller: intInputController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'litres'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('litres of water per day'),
                ],
              ),
            );
          case NutritionGoalModel model:
            return Card(
              child: Column(
                children: [
                  //* Progress bar
                  Text('I will reach my goal of (per day):'),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Text('Carbohydrate amount (g): '),
                          goalOperatorMenu(),
                          TextField(
                            controller: carbController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'g'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Calorie amount: '),
                          goalOperatorMenu(),
                          TextField(
                            controller: calorieController,
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Fat amount (g): '),
                          goalOperatorMenu(),
                          TextField(
                            controller: fatController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'g'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Fibre amount (g): '),
                          goalOperatorMenu(),
                          TextField(
                            controller: carbController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'g'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Protein amount (g): '),
                          goalOperatorMenu(),
                          TextField(
                            controller: carbController,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(suffixText: 'g'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('litres of water per day'),
                ],
              ),
            );
          case BasicStreak():
            // TODO: Handle this case.
            throw UnimplementedError();
        }
      },
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
