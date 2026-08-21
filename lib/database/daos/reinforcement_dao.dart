import 'package:drift/drift.dart';
import 'package:testrun/database/tables/reinforcement_tables.dart';
import '../database.dart';

part 'reinforcement_dao.g.dart';

@DriftAccessor(tables: [Reinforcements, Achievements])
class ReinforcementDao extends DatabaseAccessor<AppDatabase> with _$ReinforcementDaoMixin {
  ReinforcementDao(super.db);

  Future<List<Reinforcement>> getHealthConcerns() {
    final healths = (select(reinforcements)..where((r) => r.cType.equals(ConcernType.health.name))).get();
    return healths;
  }

  Future<List<Reinforcement>> getPRConcerns() {
    final prs = (select(reinforcements)..where((r) => r.cType.equals(ConcernType.pr.name))).get();
    return prs;
  }

  Future<void> changeEvalDate(int id, DateTime eval) {
    return (update(reinforcements)..where((r) => r.id.equals(id))).write(ReinforcementsCompanion(nextEval: Value(eval)));
  }
}