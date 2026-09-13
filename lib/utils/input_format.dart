import 'package:flutter/services.dart';

class MyInputFormatter extends TextInputFormatter {
  final double max;

  MyInputFormatter(this.max);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final value = double.tryParse(newValue.text);

    if (value == null || value > max || value < 1) {
      return oldValue;
    }

    return newValue;
  }

}