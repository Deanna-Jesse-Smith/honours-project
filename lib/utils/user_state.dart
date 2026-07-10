import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
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
  });
}

class UserSession extends AsyncNotifier<UserSessionData?> {
  @override
  Future<UserSessionData?> build() async {
    debugPrint('made user');
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

    final isFasting = fast == null ? false : !fast.endDateTime!.isAtSameMomentAs(fast.startDateTime);

    return UserSessionData(
      userId: user.userID,
      userName: user.name,
      startTime: user.typicalEatingStart!,
      endTime: user.typicalEatingEnd!,
      fastingForm: FastingFormConverter().fromSql(user.formIF),
      adfDaysSelected: DayOfWeekConverter().fromSQL(user.adfDaysSelected),
      fiveTwoDaysSelected: DayOfWeekConverter().fromSQL(user.fiveTwoDaysSelected),
      status: status,
      isFasting: isFasting,
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
    experience: 'Beginner',
    createdDate: DateTime.now(),
    adfDaysSelected: '',
    fiveTwoDaysSelected: '',
    formIF: FastingFormConverter().toSql(curUser.fastingForm)
  );

    FastingStatus updatedStatus = determineFastingStatus(now: DateTime.now(), user: userSnapshot, activeLog: cur);
    state = AsyncData(copyWithStatus(curUser, updatedStatus));
  }

    UserSessionData copyWithStatus(UserSessionData data, FastingStatus status) {
    return UserSessionData(
      userId: data.userId,
      userName: data.userName,
      startTime: data.startTime,
      endTime: data.endTime,
      fastingForm: data.fastingForm,
      adfDaysSelected: data.adfDaysSelected,
      fiveTwoDaysSelected: data.fiveTwoDaysSelected,
      status: status,
      isFasting: data.isFasting,
    );
  }
}

final userSessionProvider = AsyncNotifierProvider<UserSession, UserSessionData?>(UserSession.new);