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