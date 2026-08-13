import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
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
  final FastingStatus status;
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
    required this.status,
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
      status: status ?? this.status,
      isFasting: isFasting ?? this.isFasting,
      experience: exp ?? experience,
    );
  }
}

class UserSession extends AsyncNotifier<UserSessionData?> {
  @override
  Future<UserSessionData?> build() async {
    final uDao = ref.watch(uDaoProvider);
    final fDao = ref.watch(fDaoProvider);

    final user = await uDao.getUser();
    if (user == null) return null;

    final fast = await fDao.isFasting(user.userID);
    final status = determineFastingStatus(
      now: DateTime.now(),
      user: user,
      activeLog: fast,
    );

    final isFasting = fast == null
        ? false
        : !fast.endDateTime!.isAtSameMomentAs(fast.startDateTime);

    return UserSessionData(
      userId: user.userID,
      userName: user.name,
      startTime: user.typicalEatingStart!,
      endTime: user.typicalEatingEnd!,
      fastingForm: user.formIF,
      adfDaysSelected: DayOfWeekConverter().fromSQL(user.adfDaysSelected),
      fiveTwoDaysSelected: DayOfWeekConverter().fromSQL(
        user.fiveTwoDaysSelected,
      ),
      status: status,
      isFasting: isFasting,
      experience: user.experience,
    );
  }

  Future<void> refreshFastingStatus() async {
    final curUser = state.value;
    if (curUser == null) return;

    final fDao = ref.read(fDaoProvider);
    final cur = await fDao.isFasting(curUser.userId);

    if (cur == null) {
      // fDao.startFast(curUser.userId, curUser.fastingForm, DateTime.now());
      return;
    }

    final userSnapshot = User(
      userID: curUser.userId,
      name: curUser.userName,
      typicalEatingStart: curUser.startTime,
      typicalEatingEnd: curUser.endTime,
      isMetric: true,
      experience: curUser.experience,
      createdDate: DateTime.now(),
      adfDaysSelected: '',
      fiveTwoDaysSelected: '',
      formIF: curUser.fastingForm,
    );

    FastingStatus updatedStatus = determineFastingStatus(
      now: DateTime.now(),
      user: userSnapshot,
      activeLog: cur,
    );
    debugPrint('Updated fasting status: ${updatedStatus.name}');
    state = AsyncData(copy(updatedStatus, curUser.isFasting, data: curUser));
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
      status: status,
      isFasting: isFasting,
      experience: data.experience,
    );
  }

  Future<void> updateUser({
    String? userName,
    DateTime? start,
    DateTime? end,
    FastingForm? form,
    List<int>? adfDays,
    List<int>? fiveTwoDays,
  }) async {
    final cur = state.value;
    if (cur == null) return;

    final uDao = ref.read(uDaoProvider);
    final fDao = ref.read(fDaoProvider);

    state = await AsyncValue.guard(() async {
      // await uDao.upd
      //! Figure out how to do this well
    });
  }

  Future<void> toggleFast() async {
    debugPrint('Toggling fast');
    final cur = state.requireValue;
    if (cur == null) return;

    final fDao = ref.read(fDaoProvider);
    final now = DateTime.now();
    final prevFasting = cur.isFasting;

    try {
      FastLogData? updated;

      if (!prevFasting) {
        await fDao.startFast(cur.userId, cur.fastingForm, now);
        updated = await fDao.isFasting(cur.userId);
      } else {
        await fDao.breakFast(cur.userId, now);
        updated = null;
      }

      final userSnapshot = User(
        userID: cur.userId,
        name: cur.userName,
        typicalEatingStart: cur.startTime,
        typicalEatingEnd: cur.endTime,
        isMetric: true,
        experience: cur.experience,
        createdDate: DateTime.now(),
        adfDaysSelected: '',
        fiveTwoDaysSelected: '',
        formIF: cur.fastingForm,
      );

      final newStatus = determineFastingStatus(
        now: now,
        user: userSnapshot,
        activeLog: updated,
      );
      debugPrint('Toggled fasting status: ${newStatus.name}');
      final toggled = copy(newStatus, !prevFasting, data: cur);
      state = AsyncData(toggled);
    } catch (e) {
      rethrow;
    }
  }
}

final userSessionProvider =
    AsyncNotifierProvider<UserSession, UserSessionData?>(UserSession.new);
