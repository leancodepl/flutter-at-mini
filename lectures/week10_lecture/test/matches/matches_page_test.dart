import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:testing/matches/matches_page.dart';
import 'package:testing/matches/matches_repository.dart';
import 'package:testing/ui/match_item.dart';
import 'package:testing/matches/matches_models.dart';
import 'match_mocks.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('Matches page', () {
    late MatchesRepository repository;

    setUp(() {
      repository = MockMatchesRepository();
    });

    void setUpMatchesResponse([List<Match>? matches]) {
      when(() => repository.fetchMatches()).thenAnswer(
          (_) async => matches ?? [finishedMatch, penaltiesMatch, futureMatch]);
    }

    Future<void> pumpPage(WidgetTester tester) {
      return tester.pumpWidgetBuilder(
        Provider<MatchesRepository>(
          create: (context) {
            setUpMatchesResponse();
            return repository;
          },
          child: const MatchesPage(),
        ),
      );
    }

    Future<void> pumpPageWithError(WidgetTester tester) {
      return tester.pumpWidgetBuilder(
        Provider<MatchesRepository>(
          create: (context) {
            when(() => repository.fetchMatches()).thenThrow(Exception());
            return repository;
          },
          child: const MatchesPage(),
        ),
      );
    }

    testGoldens('Page should look correct with matches loaded', (tester) async {
      await pumpPage(tester);

      await multiScreenGolden(tester, 'match_details_page');
    });

    testWidgets('Page should show all matches', (tester) async {
      await pumpPage(tester);

      expect(find.byType(MatchItem), findsNWidgets(3));
    });

    testWidgets('Page should show error message when loading failed',
        (tester) async {
      await pumpPageWithError(tester);

      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('Should call fetchMatches again on pull-to-refresh gesture',
        (tester) async {
      await pumpPage(tester);

      await tester.drag(find.byKey(MatchesPage.listKey), const Offset(0, 300));
      await tester.pumpAndSettle();

      verify(() => repository.fetchMatches()).called(2);
    });

    testWidgets('Should render new matches pull-to-refresh gesture',
        (tester) async {
      await pumpPage(tester);
      setUpMatchesResponse([finishedMatch]);

      await tester.drag(find.byKey(MatchesPage.listKey), const Offset(0, 300));
      await tester.pumpAndSettle();

      expect(find.byType(MatchItem), findsOneWidget);
    });
  });
}

class MockMatchesRepository extends Mock implements MatchesRepository {}
