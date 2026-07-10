import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testrun/models/meals_model.dart';

class MealCard extends StatelessWidget {
  final MealItem meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    if (meal.ingredients != null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(DateFormat('HH:mm a').format(meal.date)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 20,
                runSpacing: 15,
                children: meal.ingredients!.map((i) {
                  return Chip(label: Text(i.name));
                }).toList(),
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(DateFormat('HH:mm a').format(meal.date)),
        ),
      );
    }

    // return Container(
    //   width: MediaQuery.sizeOf(context).width - 75,
    //   alignment: Alignment.center,
    //   decoration: BoxDecoration(
    //     color: Colors.amberAccent,
    //     borderRadius: BorderRadius.circular(25),
    //   ),
    //   child: ListView(children: [
    //     Text(DateFormat('HH:mm a').format(meal.date)),
    //     Wrap(

    //     )
    //   ],)
    // );
  }
}
