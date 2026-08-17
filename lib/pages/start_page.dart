import 'package:flutter/material.dart';
import 'package:testrun/pages/setup_user.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/dialogs.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: '');
    bool hasExperience = false;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            const Text('Welcome!', style: TextStyle(fontSize: TextSizing.large),),
            const Text('To your Intermittent Fasting Support app!', style: TextStyle(fontSize: TextSizing.large)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(controller: controller, autofocus: true, style: TextStyle(fontSize: TextSizing.medium),),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: CheckboxListTile(title: const Text('Do you have any prior Intermittent Fasting experience?', style: TextStyle(fontSize: TextSizing.medium)),value: hasExperience, onChanged: ((value) => setState(() => !hasExperience)),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (controller.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SetupUser(name: controller.text, experience: hasExperience),
                    ),
                  );
                } else {
                  await Dialogs.dangerDialog(
                    context,
                    title: 'WARNING',
                    message: 'You need to input your name to proceed',
                  );
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
