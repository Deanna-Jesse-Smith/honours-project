import 'package:drift/drift.dart';
import 'package:testrun/database/converters.dart';
import '../database.dart';
import '../tables/fasting_tables.dart';

part 'fasting_dao.g.dart';

@DriftAccessor(tables: [FastLog])
class FastingDao extends DatabaseAccessor<AppDatabase> with _$FastingDaoMixin {
  FastingDao(super.attachedDatabase);

  Future<int> startFast(int userID, FastingForm form, DateTime startTime) {
    return into(fastLog).insert(FastLogCompanion.insert(userID: userID, formIF: form.name, startDateTime: Value(startTime)));
  }

  Future<int> breakFast(int userID, DateTime endTime) async {
    final curLog = await (select(fastLog)
    ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
    ..limit(1))
    .getSingle();

    return (update(fastLog)..where((f) => f.fastLogID.equals(curLog.fastLogID))).write(FastLogCompanion(endDateTime: Value(endTime)));
  }

  Future<FastLogData?> isFasting(int userID) {
    final fast = (select(fastLog)
    ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
    ..limit(1))
    .getSingleOrNull();

    return fast;
  }

  // Future<FastLogData> getHistory() {
  //   final (select(fastLog))
  // }
}