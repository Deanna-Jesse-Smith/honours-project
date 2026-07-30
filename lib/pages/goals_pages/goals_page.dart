import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/text_sizing.dart';
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

  static final List<DropdownMenuEntry<GoalOperator>> entriess = UnmodifiableListView<DropdownMenuEntry<GoalOperator>>(GoalOperator.values.map<DropdownMenuEntry<GoalOperator>>((GoalOperator op) => DropdownMenuEntry(value: op, label: op.symbol)));
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
      appBar: AppBar(title: Text(title, style: TextStyle(fontSize: TextSizing.large),),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back),
        onTap: () => Navigator.of(context).pop(),
      ),
      actions: [
        Tooltip(
          message: '',
          triggerMode: TooltipTriggerMode.tap,
          child: IconButton(onPressed: () => Dialogs.getFastResultHelp(context), icon: Icon(Icons.question_mark))
        )
      ],
      ),
      body: SingleChildScrollView(   //! Might not be necessary, but here for now in case
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Current Goal: ')
          ],
        ),
      )
    );
  }

  FutureBuilder goalInfo() {
    return FutureBuilder(future: curGoal, builder: (context, asyncSnapshot) {
      if (!asyncSnapshot.hasData) {
        return Text('Add Goal?');
      }
      BasicGoal? goal = asyncSnapshot.data;

      if (goal == null) {
        return Text('Add Goal?');
      }

      switch (goal) {
        case FastingGoalModel model:
          // TODO: Handle this case.
          throw UnimplementedError();
        case WeightGoalModel model:
          // TODO: Handle this case.
          throw UnimplementedError();
        case HydrationGoalModel model:
          // TODO: Handle this case.
          throw UnimplementedError();
        case NutritionGoalModel model:
          // TODO: Handle this case.
          throw UnimplementedError();
        case BasicStreak():
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    });
  }

  Card getHydrationGoalCard(HydrationGoalModel model) {
    return Card(
      child: Column(
        children: [
          Text('Progress: ${model.progress * 100}'),
          Row(
            children: [
              
            ],
          ),
        ],
      )
    );
  }

  FutureBuilder streakInfo() {
        return FutureBuilder(future: curStreak, builder: (context, asyncSnapshot) {
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
    });
  }

  DropdownMenu<GoalOperator> goalOperatorMenu() {
    return DropdownMenu<GoalOperator>(dropdownMenuEntries: entriess,
    onSelected: (GoalOperator? value) {
      setState(() {
        curGoalOperator = value!;
      });
    },
    textStyle: TextStyle(fontSize: TextSizing.small),
    );
  }
}