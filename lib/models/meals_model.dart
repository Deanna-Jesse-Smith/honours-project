// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ingredient {
  final int id;
  final String name;
  final double quantity;

  Ingredient({
    required this.id,
    required this.name,
    required this.quantity,
  });
}

class Recipe {
  
}

class Meal {
  final int id;
  final List<Ingredient> ingredients;
  final DateTime date;
  final bool isInEatingWindow;
  final LogMethod log;
}

enum LogMethod {
  quick,
  full,
  repeat
}