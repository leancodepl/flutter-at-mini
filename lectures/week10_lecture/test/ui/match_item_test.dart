import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:testing/ui/match_item.dart';

import '../matches/match_mocks.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('MatchItem', () {
    testGoldens('Item should look correct', (tester) async {
      final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
        ..addScenario(
          'Finished',
          MatchItem(
            match: finishedMatch,
            onTap: () {},
          ),
        )
        ..addScenario(
          'Future',
          MatchItem(
            match: futureMatch,
            onTap: () {},
          ),
        )
        ..addScenario(
          'Finished with penalties',
          MatchItem(
            match: penaltiesMatch,
            onTap: () {},
          ),
        );

      await tester.pumpWidgetBuilder(builder.build());

      await screenMatchesGolden(tester, 'match_item');
    });
  });
}
