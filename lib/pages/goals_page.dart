import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/tables/goal_tables.dart';

class GoalsPage extends ConsumerStatefulWidget {
  final GoalType curType;
  const GoalsPage({super.key, required this.curType});

  @override
  ConsumerState<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends ConsumerState<GoalsPage> {
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(widget.curType.forDisplay),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back),
        onTap: () => Navigator.of(context).pop(),
      ),
    ),
    body: Column(
      children: [
        Text('Streak Goal'),

      ],
    ),);
  }


  Row findStreakFastingGoal() {
    return .new(children: [
      
    ]);
  }

  Column makeHydrationStreakGoal() {
    return .new(children: [

    ]);
  }

  Column makeNutritionGoals() {
    return .new(children: [
      
    ]);
  }
}