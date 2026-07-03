import 'package:drift/drift.dart';

enum FastingForm {tre, fiveTwo, adf}

class FastingFormConverter extends TypeConverter<FastingForm, String> {
  const FastingFormConverter();

  @override
  FastingForm fromSql(String fromDB) {
    return FastingForm.values.firstWhere((f) => f.name == fromDB);
  }
  
  @override
  String toSql(FastingForm value) => value.name;
}

enum DayOfWeek {m, t, w, th, f, sat, sun}

class DayOfWeekConverter extends TypeConverter<DayOfWeek, String> {
  const DayOfWeekConverter();

  @override
  DayOfWeek fromSql(String fromDB) {
    return DayOfWeek.values.firstWhere((f) => f.name == fromDB);
  }
  
  @override
  String toSql(DayOfWeek value) => value.name;
}