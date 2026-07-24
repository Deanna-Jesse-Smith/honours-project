import 'package:drift/drift.dart';
import 'package:testrun/database/tables/reinforcement_tables.dart';
import '../database.dart';

part 'reinforcement_dao.g.dart';

@DriftAccessor(tables: [Reinforcements, Achievements])
class ReinforcementDao extends DatabaseAccessor<AppDatabase> with _$ReinforcementDaoMixin {
  ReinforcementDao(super.db);
  
}