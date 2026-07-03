import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/daos/hydration_dao.dart';
import 'package:testrun/database/daos/user_dao.dart';
import 'package:testrun/database/tables/fasting_tables.dart';
import 'package:testrun/database/tables/hydration_tables.dart';
import 'package:testrun/database/tables/weight_tables.dart';

import 'tables/user_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    FastLog,
    HydrationLog,
    WeightLog,
  ],
  daos: [
    UserDao,
    FastingDao,
    HydrationDao,
    ]
)

class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]): super(executor ?? _openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      await m.createTable(HydrationLog as TableInfo<Table, dynamic>);
      // if (from < 2) {
      //   await m.createTable(FastLog as TableInfo<Table, dynamic>);
      // }
    }
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'ifs',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

