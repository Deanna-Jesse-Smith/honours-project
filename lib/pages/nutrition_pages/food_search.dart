import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/tables/nutrition_tables/food_table.dart';

class FoodSearch extends StatefulWidget {
  const FoodSearch({super.key});

  @override
  State<FoodSearch> createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  // final foodSearchProvider = FutureProvider.family<List<Food>, String>((ref, query) {
  //   // final repo = ref.watch(listenable)
  // });
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}