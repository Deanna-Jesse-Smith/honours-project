import 'package:flutter/material.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/custom_checkbox.dart';

class SetupUser extends StatefulWidget {
  const SetupUser({super.key});

  @override
  State<SetupUser> createState() => _SetupUserState();
}

enum Measurement { metric, imperial }

List<bool> daysSelected = List.filled(7, false);

class _SetupUserState extends State<SetupUser> {
  Measurement? measurement = Measurement.metric;
  DateTime selectedDate = DateTime(2008);
  // bool? measurement = false;

  @override
  Widget build(BuildContext context) {
    int initialVal = 0;
    final contorller = TextEditingController(text: initialVal.toString());
    return Scaffold(
      appBar: AppBar(title: Text('Beginner'), centerTitle: true),
      body: Column(
        children: [
          Text(
            'Forms of Intermittent Fasting',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          buildTextCard(
            'Time Restricted Eating',
            'This is where you restrict when you eat to only certain hours of the day.\n\n For example: a common way to do this method is the 16:8 split, where you fast for 16 hours of the day and eat whatever you want for the remaining 8.',
          ),
          Text('Questions', style: TextStyle(fontWeight: FontWeight.bold)),
          buildQuestion('Do you prefer metric or imperial?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (c) => getBox(c, daysSelected)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (c) => getBox(c + 4, daysSelected)),
          ),
          ElevatedButton(onPressed: () async {
            final DateTime? dateTime = await showDatePicker(
              context: context, 
              initialDate: selectedDate,
              firstDate: DateTime(2000), 
              lastDate: DateTime(3000)
              );
              if (dateTime != null) {
                setState(() {
                  selectedDate = dateTime;
                });
              }
          }, child: Text('Select Birthday')),
          Text('How tall are you?'),
          TextField(
            controller: contorller,
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(suffixText: 'cm'),
          ),
          Text('How much do you weigh?'),
          TextField(
            controller: contorller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(suffixText: 'kg'),
          ),
          Text('Do you eat meals with family or friends regularly?')
        ],
      ),
    );
  }

  // selectBirthday(BuildContext context) async {
  //   final DateTime? selected = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2008),
  //   );

  //   if (selected != selectedDate) {
  //     setState(() {
  //       selectedDate = selected;
  //     });
  //   }
  // }

    CustomCheckbox getBox(int index, List<bool> curList) => .new(isSelected: curList[index], dayOfWeek: daysOfWeek[index], onTap: (bool val) {
      setState(() {
        curList[index] = val;
      });
    });

  Widget buildTextCard(String title, text) {
    //  bool isExpanded = false;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ExpansionTile(
          title: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: TextSizing.medium),
          ),
          children: [Text(text, style: TextStyle(fontSize: TextSizing.medium))],
        ),
      ),
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
                Radio<Measurement>(value: Measurement.imperial),
                // ListTile(
                //   title: Text("Imperial"),
                //   leading: Radio<Measurement>(value: Measurement.imperial),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
