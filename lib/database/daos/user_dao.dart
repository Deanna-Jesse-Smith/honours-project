import 'package:drift/drift.dart';
import 'package:testrun/database/converters.dart';
import '../database.dart';
import '../tables/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<int> addUser(
    String name,
    bool isMetric,
    FastingForm form,
    String exp,
  ) {
    return into(users).insert(
      UsersCompanion.insert(formIF: form.name, experience: exp, name: name),
    );
  }

  Future<void> updateTREtimes(int id, DateTime start, DateTime end) {
    return (update(users)..where((u) => u.userID.equals(id))).write(
      UsersCompanion(
        typicalEatingStart: Value(start),
        typicalEatingEnd: Value(end),
      ),
    );
  }

Future<String?> getName() async {
  final lastUser = await (select(users)
        ..orderBy([(u) => OrderingTerm.desc(u.userID)])
        ..limit(1))
      .getSingleOrNull();

  return lastUser?.name;
}

Future<User?> getUser() async {
  final lastUser = await (select(users)
        ..orderBy([(u) => OrderingTerm.desc(u.userID)])
        ..limit(1))
      .getSingleOrNull();

  return lastUser;
}
}
