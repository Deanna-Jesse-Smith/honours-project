import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/utils/text_sizing.dart';

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
                children: meal.ingredients != null ? meal.ingredients!.map((i) {
                  return Chip(label: Text(i.name));
                }).toList() : List.empty(),
              ),
              Text('${meal.getTotalCalories()} calories'),
              Text('${meal.getTotalFibre()}g fibre')
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
  }
}

class DaySection extends StatelessWidget {
  final DayMeals dayMeal;
  const DaySection({super.key, required this.dayMeal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(DateFormat('EEE, M/d/y').format(dayMeal.meals.first.date)),
        ...dayMeal.meals.map((meal) => MealCard(meal: meal)),
      ],
    );
  }
}

class FoodRow extends StatelessWidget {
  final FoodData item;
  final double initialVal = 0, maxVal = 10;
  double curVal;
  final ValueChanged<double> increment, decrement;

  FoodRow({super.key, required this.item, required this.increment, required this.decrement, required this.curVal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${item.name} (${item.servingDescription})'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => decrement((curVal - 1) >= initialVal ? curVal - 1 : initialVal),
              icon: Icon(Icons.remove_circle_outline),
            ),
            Text(
              '${curVal.toInt()}',
              style: const TextStyle(fontSize: TextSizing.medium),
            ),
            IconButton(
              onPressed: () => increment((curVal + 1) <= maxVal ? curVal + 1 : maxVal),
              icon: Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }
}

