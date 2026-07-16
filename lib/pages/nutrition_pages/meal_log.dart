import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/main_app_bar.dart';

class MealLog extends ConsumerStatefulWidget {
  const MealLog({super.key});

  @override
  ConsumerState<MealLog> createState() => _MealLogState();
}

class _MealLogState extends ConsumerState<MealLog> {
  @override
  Widget build(BuildContext context) {
       final session = ref.watch(userSessionProvider).value;
    CustomWidgets customWidgets = CustomWidgets();
    
    return Scaffold(
            appBar: AppBar(
        title: Text(
          'Log a Meal',
          style: TextStyle(
            color: Colors.black,
            fontSize: TextSizing.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => {Navigator.of(context).pop()},
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Text('Works'),
      ),
    );
  }
}