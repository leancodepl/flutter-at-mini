import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing/matches/matches_cubit.dart';
import 'package:testing/matches/matches_repository.dart';

import 'match_mocks.dart';

void main() {
  group('MatchesCubit', () {
    late MatchesRepository repository;

    setUp(() {
      repository = MockMatchesRepository();
    });

    MatchesCubit buildCubit() => MatchesCubit(repository);

    blocTest<MatchesCubit, MatchesState>(
      'Emits success state with matches',
      build: () {
        when(() => repository.fetchMatches())
            .thenAnswer((_) async => [finishedMatch]);

        return buildCubit();
      },
      act: (cubit) => cubit.fetch(),
      expect: () => [
        isA<MatchesLoaded>().having(
          (p) => p.matches,
          'matches',
          [finishedMatch],
        ),
      ],
    );

    blocTest<MatchesCubit, MatchesState>(
      'Emits error state when the request fails',
      build: () {
        when(() => repository.fetchMatches()).thenThrow(Exception());

        return buildCubit();
      },
      act: (cubit) => cubit.fetch(),
      expect: () => [
        const MatchesError(),
      ],
    );
  });
}

class MockMatchesRepository extends Mock implements MatchesRepository {}
