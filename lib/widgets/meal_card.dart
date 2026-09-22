import 'dart:io';

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
    if (meal.ingredients.isNotEmpty) {
      return Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                '${meal.cate.cardName} — ${DateFormat('HH:mm a').format(meal.date)}',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 1,
                children: meal.ingredients
                    .map(
                      (i) => Chip(
                        label: Text(
                          '${i.quantity} ${i.name}',
                          style: TextStyle(fontSize: TextSizing.medium),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 5),
              Text(
                '${meal.getTotalCalories()} calories',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
              Text(
                '${meal.getTotalProtein().toStringAsFixed(1)}g protein',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
              Text(
                '${meal.getTotalFibre().toStringAsFixed(1)}g fibre',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
              Text(
                '${meal.getTotalFat().toStringAsFixed(1)}g fat',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
              Text(
                '${meal.getTotalCarbs().toStringAsFixed(1)}g carbs',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
            ],
          ),
        ),
      );
    } else {
      return Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            '${meal.cate.cardName} — ${DateFormat('HH:mm a').format(meal.date)}',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ),
      );
    }
  }
}

class FoodCard extends StatelessWidget {
  final FoodLogData food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(food.category.cardName),
                Text(DateFormat('HH:mm a').format(food.logDate)),
              ],
            ),
            if (food.comment != null) Text(food.comment!),
            if (food.path.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(food.path),
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// class DaySection extends StatelessWidget {
//   final DayFoods dayMeal;
//   const DaySection({super.key, required this.dayMeal});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       spacing: 8,
//       children: [
//         Text(DateFormat('EEE, M/d/y').format(dayMeal.day)),
//         ...dayMeal.foods.map((meal) => FoodCard(food: meal)),
//       ],
//     );
//   }
// }

class DaySection extends StatelessWidget {
  final DayMeals dayMeal;
  const DaySection({super.key, required this.dayMeal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        if (dayMeal.meals.isNotEmpty) Text(
          '${DateFormat('EEE, M/d/y').format(dayMeal.meals.first.date)} (${dayMeal.getTotalCalories()} calories)',
          style: TextStyle(
            fontSize: TextSizing.medium,
            fontWeight: FontWeight.bold,
          ),
        ) else Text(
          '${DateFormat('EEE, M/d/y').format(dayMeal.day)} (No meals logged)',
          style: TextStyle(
            fontSize: TextSizing.medium,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${dayMeal.getTotalProtein().toStringAsFixed(1)}g protein, ${dayMeal.getTotalFibre().toStringAsFixed(1)}g fibre, ${dayMeal.getTotalFat().toStringAsFixed(1)}g fat, ${dayMeal.getTotalCarbs().toStringAsFixed(1)}g carbs',
          style: TextStyle(
            fontSize: TextSizing.smallmed,
          ),
        ),
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

  FoodRow({
    super.key,
    required this.item,
    required this.increment,
    required this.decrement,
    required this.curVal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(item.name),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => decrement(
                (curVal - 1) >= initialVal ? curVal - 1 : initialVal,
              ),
              icon: Icon(Icons.remove_circle_outline),
            ),
            Text(
              '${curVal.toInt()}',
              style: const TextStyle(fontSize: TextSizing.medium),
            ),
            IconButton(
              onPressed: () =>
                  increment((curVal + 1) <= maxVal ? curVal + 1 : maxVal),
              icon: Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }
}

// class IngredientRow extends StatelessWidget {
//   final Ingredient item;
//   final double initialVal = 0, maxVal = 10;
//   double curVal;
//   final ValueChanged<double> increment, decrement;

//   IngredientRow({super.key, required this.item, required this.increment, required this.decrement, required this.curVal});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text('${item.name})'),  //? Maybe add serving description later?
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               onPressed: () => decrement((curVal - 1) >= initialVal ? curVal - 1 : initialVal),
//               icon: Icon(Icons.remove_circle_outline),
//             ),
//             Text(
//               '${curVal.toInt()}',
//               style: const TextStyle(fontSize: TextSizing.medium),
//             ),
//             IconButton(
//               onPressed: () => increment((curVal + 1) <= maxVal ? curVal + 1 : maxVal),
//               icon: Icon(Icons.add_circle_outline),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
