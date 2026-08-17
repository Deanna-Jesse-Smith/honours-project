import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/reminder_model.dart';
import 'package:testrun/utils/suggestions.dart';

class UserState {
  int userID = -1;
  final ValueNotifier<String> userName = ValueNotifier("");
  final ValueNotifier<bool> isFasting = ValueNotifier(false);
  final ValueNotifier<FastingStatus> status = ValueNotifier(
    FastingStatus.upcoming,
  );
  final ValueNotifier<FastingForm> fastingForm = ValueNotifier(FastingForm.tre);
  final ValueNotifier<DateTime> startTime = ValueNotifier(DateTime(0));
  final ValueNotifier<DateTime> endTime = ValueNotifier(DateTime(0));
  final ValueNotifier<String> adfDaysSelected = ValueNotifier('');
  final ValueNotifier<String> fiveTwoDaysSelected = ValueNotifier('');
}

// final userState = UserState();

class UserSessionData {
  final int userId;
  final String userName;
  final DateTime startTime;
  final DateTime endTime;
  final FastingForm fastingForm;
  final List<int> adfDaysSelected;
  final List<int> fiveTwoDaysSelected;
  final bool isFasting;
  final Experience experience;

  const UserSessionData({
    required this.userId,
    required this.userName,
    required this.startTime,
    required this.endTime,
    required this.fastingForm,
    required this.adfDaysSelected,
    required this.fiveTwoDaysSelected,
    required this.isFasting,
    required this.experience,
  });

  UserSessionData copyWith({
    String? userName,
    DateTime? startTime,
    DateTime? endTime,
    FastingForm? fastingForm,
    List<int>? adfDaysSelected,
    List<int>? fiveTwoDaysSelected,
    FastingStatus? status,
    bool? isFasting,
    Experience? exp,
  }) {
    return UserSessionData(
      userId: userId,
      userName: userName ?? this.userName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      fastingForm: fastingForm ?? this.fastingForm,
      adfDaysSelected: adfDaysSelected ?? this.adfDaysSelected,
      fiveTwoDaysSelected: fiveTwoDaysSelected ?? this.fiveTwoDaysSelected,
      isFasting: isFasting ?? this.isFasting,
      experience: exp ?? experience,
    );
  }
}

class UserSession extends AsyncNotifier<UserSessionData?> {
  @override
  Future<UserSessionData?> build() async {
    debugPrint('session start');
    final uDao = ref.watch(uDaoProvider);
    debugPrint('session watching');
    final fDao = ref.watch(fDaoProvider);

    final user = await uDao.getUser();
    if (user == null) {
      debugPrint('session null');
      return null;
    }
    debugPrint('session not null');

    final isFasting = await fDao.isFasting();
  
        return  UserSessionData(
      userId: user.userID,
      userName: user.name,
      startTime: user.typicalEatingStart!,
      endTime: user.typicalEatingEnd!,
      fastingForm: user.formIF,
      adfDaysSelected: DayOfWeekConverter().fromSQL(user.adfDaysSelected),
      fiveTwoDaysSelected: DayOfWeekConverter().fromSQL(
        user.fiveTwoDaysSelected,
      ),
      isFasting: isFasting,
      experience: user.experience,
    );

  }

  UserSessionData copy(
    FastingStatus status,
    bool isFasting, {
    required UserSessionData data,
  }) {
    return UserSessionData(
      userId: data.userId,
      userName: data.userName,
      startTime: data.startTime,
      endTime: data.endTime,
      fastingForm: data.fastingForm,
      adfDaysSelected: data.adfDaysSelected,
      fiveTwoDaysSelected: data.fiveTwoDaysSelected,
      isFasting: isFasting,
      experience: data.experience,
    );
  }

  Future<bool> updateTRE(TimeOfDay start, TimeOfDay end) async {
    if ((end.hour * 60) + end.minute - ((start.hour * 60) + start.minute) > 1200) {
      return false;
    }
    ref.read(uDaoProvider).updateTREtimes(state.value!.userId, start.dateTimeConversion, end.dateTimeConversion);
    ref.invalidateSelf();
    return true;
  }

  Future<bool> updateADF(List<int> days) async {
    //! check if it is a healthy schedule
    ref.read(uDaoProvider).updateADF(state.value!.userId, days);
    ref.invalidateSelf();
    return true;
  }

  Future<bool> update52(List<int> days) async {
    //! check if it is a healthy schedule
    ref.read(uDaoProvider).update52(state.value!.userId, days);
    ref.invalidateSelf();
    return true;
  }
}

final userSessionProvider =
    AsyncNotifierProvider<UserSession, UserSessionData?>(UserSession.new);
