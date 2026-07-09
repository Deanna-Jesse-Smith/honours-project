import 'package:flutter/foundation.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';

class UserState {
  int userID = -1;
  final ValueNotifier<String> userName = ValueNotifier("");
  final ValueNotifier<bool> isFasting = ValueNotifier(false);
  final ValueNotifier<FastingStatus> status = ValueNotifier(FastingStatus.upcoming);
  final ValueNotifier<FastingForm> fastingForm = ValueNotifier(FastingForm.tre);
  final ValueNotifier<DateTime> startTime = ValueNotifier(DateTime(0));
  final ValueNotifier<DateTime> endTime = ValueNotifier(DateTime(0));
  final ValueNotifier<String> adfDaysSelected = ValueNotifier('');
  final ValueNotifier<String> fiveTwoDaysSelected = ValueNotifier('');
}

final userState = UserState();