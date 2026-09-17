import 'package:flutter/material.dart';
import 'package:testrun/pages/setup_user.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class FastingInformation extends StatelessWidget {
  final bool isForStart;
  final String name;
  final bool hasExperience;
  const FastingInformation({
    super.key,
    this.isForStart = false,
    this.name = '',
    this.hasExperience = false,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Name: $name exp: $hasExperience');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Intermittent Fasting',
          style: TextStyle(fontSize: TextSizing.large),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        actions: [
          const Tooltip(
            message:
                'Toggle your fast from the floating action button on your screen when you want to start or end a TRE or ADF fast. A 5:2 fast is recorded in the week following the fast based on your recorded meals.',
            textStyle: TextStyle(fontSize: TextSizing.small),
            constraints: BoxConstraints(maxWidth: 300),
            triggerMode: TooltipTriggerMode.tap,
            showDuration: Duration(seconds: 10),
            child: SizedBox(width: 50, child: Icon(Icons.question_mark)),
          ),
        ],
      ),
      drawer: isForStart ? null : MyNavigationDrawer(),
      body: Column(
        children: [
          buildTextCard(
            'Time Restricted Eating',
            'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
          ),
          buildTextCard(
            'Alternate Day Fasting',
            'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
          ),
          buildTextCard(
            'Modified Fasting/5:2',
            'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: isForStart
          ? [
              FilledButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SetupUser(name: name, experience: hasExperience),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ),
            ]
          : null,
    );
  }

  Widget buildTextCard(String title, text) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ExpansionTile(
          title: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: TextSizing.medium),
          ),
          children: [Text(text, style: TextStyle(fontSize: TextSizing.medium))],
        ),
      ),
    );
  }
}
