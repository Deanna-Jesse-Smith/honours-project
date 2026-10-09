import 'package:flutter_test/flutter_test.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/statistics_model.dart';

void main() {
  FastLogData fast({
    required int id,
    required DateTime start,
    required DateTime end,
  }) {
    return FastLogData(
      fastLogID: id,
      userID: 1,
      formIF: FastingForm.tre,
      earlyFastResult: FastResult.asPlanned,
      lateFastResult: FastResult.asPlanned,
      earlyResultSeverity: 0,
      lateResultSeverity: 0,
      startDateTime: start,
      endDateTime: end,
    );
  }

  test('statistics count only the earliest-starting fast for each day', () {
    final statistics = StatisticsModel(
      curFasts: [
        fast(
          id: 2,
          start: DateTime(2026, 8, 1, 21),
          end: DateTime(2026, 8, 2, 15),
        ),
        fast(
          id: 1,
          start: DateTime(2026, 8, 1, 20),
          end: DateTime(2026, 8, 2, 12),
        ),
        fast(
          id: 3,
          start: DateTime(2026, 8, 2, 20),
          end: DateTime(2026, 8, 3, 8),
        ),
      ],
      curForm: FastingForm.tre,
    );

    expect(statistics.getNumFasts(), 2);
    expect(statistics.numCompleted(), 2);
    expect(statistics.getTotalForMonth(), '28 h');
    expect(statistics.getAverage(), '14 h');
  });
}
