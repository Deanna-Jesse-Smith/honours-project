import 'package:flutter/material.dart';
import 'package:testrun/utils/text_sizing.dart';

class SetupUser extends StatefulWidget {
  const SetupUser({super.key});

  @override
  State<SetupUser> createState() => _SetupUserState();
}

enum Measurement {metric, imperial}

class _SetupUserState extends State<SetupUser> {
  Measurement? measurement = Measurement.metric;
  // bool? measurement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beginner'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Text('Forms of Intermittent Fasting',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
          ),
          buildTextCard('Time Restricted Eating', 'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.'),
          Text('Questions',
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          buildQuestion('Do you prefer metric or imperial?'),
          buildCheckBoxes()
        ],
      )
    );
  }

  Widget buildTextCard(String title, text) {
    //  bool isExpanded = false;

     return    Padding(
    padding: EdgeInsets.all(10),
    child: Card(
      child: ExpansionTile(
        title: Text(title, 
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: TextSizing.medium),),
        children: [Text(text,
        style: TextStyle(fontSize: TextSizing.medium),)],
      )
      )
  );
  }

  Widget buildQuestion(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(title),
          RadioGroup<Measurement>(
            groupValue: measurement,
            onChanged: (Measurement? value) {
              setState(() {
                measurement = value;
              });
            },
            child: Row(
              children: [
                SizedBox(width: 30),
                Text('Metric'),
                Radio<Measurement>(value: Measurement.metric),
                const SizedBox(width: 12),
                Text('Imperial'),
                Radio<Measurement>(value: Measurement.imperial,)
                // ListTile(
                //   title: Text("Imperial"),
                //   leading: Radio<Measurement>(value: Measurement.imperial),
                // )
              ],
              )
          )
        ],
      )
    );
  }

  bool? isMonday = false, isTuesday = false;
  Widget buildCheckBoxes() {

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          CheckboxListTile(title: Text('M'),
          checkboxShape: CircleBorder(),
          value: isMonday, 
          onChanged: (bool? newValue) {
            setState(() {
              isMonday = newValue;
            });
          }),
          Checkbox(
            value: isTuesday, 
          onChanged: (value) {
            isTuesday = value;
          })
        ],
        )
    );
  }
}