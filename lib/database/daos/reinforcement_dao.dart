import 'package:drift/drift.dart';
import 'package:testrun/database/tables/reinforcement_tables.dart';
import 'package:testrun/models/goals_model.dart';
// import 'package:testrun/main.dart';
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

  Future<void> dummyData() {
    into(reinforcements).insert(ReinforcementsCompanion.insert(cType: ConcernType.health, type: Value(GoalType.fasting), title: 'Test 1', displayContext: 'Testing 1', citation: 'Teting 1', threshold: 2, window: 14));
    return into(reinforcements).insert(ReinforcementsCompanion.insert(cType: ConcernType.pr, type: Value(null), title: 'Test 2', displayContext: 'Testing 2', citation: 'Teting 2', threshold: 2, window: 14));
  }
}