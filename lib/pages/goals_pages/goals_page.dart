import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  late Future<BasicGoal?> curGoal;
  late Future<BasicStreak?> curStreak;
  final TextEditingController intInputController = TextEditingController(
    text: '1',
  );

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

    curGoal = ref.watch(gDaoProvider).findActiveGoal(type);
    curStreak = ref.watch(gDaoProvider).checkActiveStreak(type);
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


            return Card();
          case WeightGoalModel model:
            // TODO: Handle this case.
            throw UnimplementedError();
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
            // TODO: Handle this case.
            throw UnimplementedError();
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

        switch (streak) {
          case FastingStreak streak:
            throw UnimplementedError();
          case WeightGoalModel():
            // TODO: Handle this case.
            throw UnimplementedError();
          case HydrationGoalModel streak:
            // TODO: Handle this case.
            throw UnimplementedError();
          case NutritionGoalModel streak:
            // TODO: Handle this case.
            throw UnimplementedError();
          case BasicStreak streak:
            // TODO: Handle this case.
            throw UnimplementedError();
        }
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
