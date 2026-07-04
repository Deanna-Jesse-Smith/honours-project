import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get userID => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get isMetric => boolean().withDefault(const Constant(true))();
  TextColumn get formIF => text().withDefault(const Constant('TRE'))();
  TextColumn get experience => text().withDefault(const Constant('Beginner'))();
  DateTimeColumn get typicalEatingStart => dateTime().nullable()();
  DateTimeColumn get typicalEatingEnd => dateTime().nullable()();
  DateTimeColumn get createdDate => dateTime().withDefault(currentDateAndTime)();
  TextColumn get adfDaysSelected => text().withDefault(const Constant(''))();
  TextColumn get fiveTwoDaysSelected => text().withDefault(const Constant(''))();
}