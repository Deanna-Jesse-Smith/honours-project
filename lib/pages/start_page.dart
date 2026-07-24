import 'package:flutter/material.dart';
import 'package:testrun/pages/setup_user.dart';
import 'package:testrun/utils/suggestions.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller =TextEditingController(text: '');
    Experience? exp = Experience.beginner;
    return Scaffold(
      body: Column(
        children: [
          const Text('Welcome!'),
          const Text('To your Intermittent Fasting Support app!'),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: TextField(
              controller: controller,
              autofocus: true,
            ),
          ),
          SizedBox(height: 50),
          Padding(padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: RadioGroup<Experience>(groupValue: exp, 
          onChanged: (Experience? value) => setState(() => exp = value), 
          child: Row(
            children: [
                SizedBox(width: 30),
                Text('Beginner'),
                Radio<Experience>(value: Experience.beginner),
                const SizedBox(width: 12),
                Text('Experienced'),
                Radio<Experience>(value: Experience.experienced),
            ],
          )),),
          ElevatedButton(onPressed: () {
            if (controller.text.isNotEmpty) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SetupUser(name: controller.text, experience: exp!.name)));
            }
          }, child: const Text('Sign Up'))
        ],
      ),
    );
  }
}