import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/tables/goal_tables.dart';

class GoalsPage extends ConsumerStatefulWidget {
  final GoalType type;
  const GoalsPage({super.key, required this.type});

  @override
  ConsumerState<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends ConsumerState<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.type.name),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back),
        onTap: () => Navigator.of(context).pop(),
      ),
      actions: [

      ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
        ],
      )
    );
  }
}