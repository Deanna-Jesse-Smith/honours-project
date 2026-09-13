// Meals PK mealID FK userID mealType date time inEatingWindow logMethod

import 'package:drift/drift.dart';
import 'package:testrun/models/meals_model.dart';

class Meals extends Table {
  IntColumn get mealID => integer().autoIncrement()();
  // IntColumn get userID => integer().references(Users, #userID)();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  // BoolColumn get inEatingWindow => boolean().withDefault(const Constant(false))();
  TextColumn get logMethod => textEnum<LogMethod>()();
  TextColumn get mealType => textEnum<MealCategory>()();
  RealColumn get amount => real().withDefault(const Constant(0))();
}