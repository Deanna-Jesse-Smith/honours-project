import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/reminder_model.dart';
import 'package:testrun/utils/suggestions.dart';

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
  final double height;
  final bool isFemale;

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
    required this.height,
    required this.isFemale,
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
    double? height,
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
      height: height ?? this.height,
      isFemale: isFemale,
    );
  }
}

class UserSession extends AsyncNotifier<UserSessionData?> {
  bool fiveTwoComplete = false;
  @override
  Future<UserSessionData?> build() async {
    final uDao = ref.watch(uDaoProvider);
    final fDao = ref.watch(fDaoProvider);

    final user = await uDao.getUser();
    if (user == null) {
      return null;
    }

    List<int> days = DayOfWeekConverter().fromSQL(user.fiveTwoDaysSelected);
    if (!fiveTwoComplete && user.formIF == FastingForm.fiveTwo) {
      fiveTwoComplete = true;
      await check52Adherence(user.userID, user.createdDate, days, fDao);
    }

    final isFasting = await fDao.isFasting(user.userID);

    // fDao.dummyData();

    // final isFasting = await fDao.isFasting();

    return UserSessionData(
      userId: user.userID,
      userName: user.name,
      startTime: user.typicalEatingStart!,
      endTime: user.typicalEatingEnd!,
      fastingForm: user.formIF,
      adfDaysSelected: DayOfWeekConverter().fromSQL(user.adfDaysSelected),
      fiveTwoDaysSelected: days,
      isFasting: isFasting,
      experience: user.experience,
      height: user.height,
      isFemale: user.isGender,
    );
  }

  Future<void> check52Adherence(
    int userID,
    DateTime createdDate,
    List<int> days,
    FastingDao fDao,
  ) async {
    DateTime now = DateUtils.dateOnly(
      DateTime.now(),
    ).subtract(const Duration(days: 1));
    DateTime prevWeek = now.subtract(const Duration(days: 7));

    final candidates = days.map(getFullDay).toList()..sort();
    candidates.removeWhere((date) => date.isBefore(createdDate));

    final prevWeekFasts = await ref
        .read(fDaoProvider)
        .find52Fasts(prevWeek, now);

    candidates.removeWhere(
      (date) => prevWeekFasts.map((day) => day.startDateTime).contains(date),
    );

    if (candidates.isNotEmpty) {
      final nDao = ref.read(nDaoProvider);
      for (final candidate in candidates) {
        final mealCount = await nDao.fiveTwoDayEvaluation(candidate);
        if (mealCount <= 500) {
          await fDao.createSyntheticFiveTwoLog(
            userID,
            candidate,
            FastResult.underate,
          );
        } else if (mealCount <= 700) {
          await fDao.createSyntheticFiveTwoLog(
            userID,
            candidate,
            FastResult.asPlanned,
          );
        } else {
          await fDao.createSyntheticFiveTwoLog(
            userID,
            candidate,
            FastResult.overate,
          );
        }
      }
    }
  }

  DateTime getFullDay(int dayOfWeek) {
    dayOfWeek++;
    DateTime now = DateTime.now();

    final diff = (dayOfWeek - now.weekday) % 7;

    return DateUtils.dateOnly(now.subtract(Duration(days: diff)));
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
      height: data.height,
      isFemale: data.isFemale,
    );
  }

  Future<bool> updateTRE(
    TimeOfDay start,
    TimeOfDay end, {
    bool force = true,
  }) async {
    if (force) {
      if (start.isAtSameTimeAs(end)) {
        return false;
      } else if (start.isBefore(end)) {
        if ((end.hour * 60) + end.minute - ((start.hour * 60) + start.minute) >
            720) {
          return false;
        }
      } else if (((24 - start.hour) * 60) +
              start.minute +
              (end.hour * 60) +
              end.minute >
          720) {
        return false;
      }
    }

    await ref
        .read(uDaoProvider)
        .updateTREtimes(
          state.value!.userId,
          start.dateTimeConversion,
          end.dateTimeConversion,
        );
    ref.invalidateSelf();
    return true;
  }

  Future<void> updateTREWithoutValidation(
    TimeOfDay start,
    TimeOfDay end,
  ) async {
    await ref
        .read(uDaoProvider)
        .updateTREtimes(
          state.value!.userId,
          start.dateTimeConversion,
          end.dateTimeConversion,
        );
    ref.invalidateSelf();
  }

  Future<void> updateADF(List<int> days) async {
    await ref.read(uDaoProvider).updateADF(state.value!.userId, days);
    ref.invalidateSelf();
  }

  Future<void> update52(List<int> days) async {
    await ref.read(uDaoProvider).update52(state.value!.userId, days);
    ref.invalidateSelf();
  }

  Future<void> updateDetails(
    String name,
    double height,
    DateTime? birthday,
  ) async {
    await ref
        .read(uDaoProvider)
        .changeDetails(state.value!.userId, name, height, birthday);
    ref.invalidateSelf();
  }
}

final userSessionProvider =
    AsyncNotifierProvider<UserSession, UserSessionData?>(UserSession.new);
