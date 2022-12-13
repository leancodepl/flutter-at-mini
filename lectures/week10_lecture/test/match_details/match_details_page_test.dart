import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:testing/match_details/match_details_page.dart';

import '../matches/match_mocks.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('MatchDetailsPage', () {
    testGoldens('Page should look correct', (tester) async {
      await tester.pumpWidgetBuilder(MatchDetailsPage(match: finishedMatch));

      await screenMatchesGolden(tester, 'match_details_page');
    });
  });
}
