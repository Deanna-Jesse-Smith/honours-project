import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:testrun/database/converters.dart';
import '../database.dart';
import '../tables/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.attachedDatabase);

  Future<int> addUser(String name, bool isMetric, FastingForm form, String exp) {
    return into(users).insert(UsersCompanion.insert(formIF: form.name, experience: exp, name: name, isFasting: Value(false)));
  }

  Future<void> updateTREtimes(int id, DateTime start, DateTime end) {
    return (update(users)..where((u) => u.userID.equals(id))).write(UsersCompanion(typicalEatingStart: Value(start), typicalEatingEnd: Value(end)));
  }

  Future<void> changeIsFasting(int id, bool changeTo) {
    return (update(users)..where((u) => u.userID.equals(id))).write(UsersCompanion(isFasting: Value(changeTo)));
  }

  Future<User> getIsFasting(int id) {
    final user = (select(users)..where((u) => u.userID.equals(id))).getSingle();

    return user;
  }
}