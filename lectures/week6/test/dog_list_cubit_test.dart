import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:week6/bloc/dog_list_cubit.dart';
import 'package:week6/bloc/dog_list_state.dart';
import 'package:week6/data/dog_api.dart';

class MockDogApi extends Mock implements DogApi {}

void main() {
  group('DogListCubit', () {
    late DogListCubit cubit;
    late DogApi api;

    setUp(() {
      api = MockDogApi();
      cubit = DogListCubit(api: api);
    });

    test('has EmptyDogList as the initial state', () {
      expect(cubit.state, const EmptyDogList());
    });

    // test('emits LoadingState after fetch', () async {
    //   when(() => api.fetchAll()).thenAnswer((_) async => []);
    //   await cubit.fetchDogs();
    //   expect(
    //     cubit.state,
    //     isA<FetchedDogList>().having((s) => s.dogs, 'dogs', isEmpty),
    //   );
    // });

    blocTest<DogListCubit, DogListState>(
      'emits LoadingState after fetch',
      build: () {
        when(() => api.fetchAll()).thenAnswer((_) async => []);
        return DogListCubit(api: api);
      },
      act: (cubit) => cubit.fetchDogs(),
      expect: () => contains(const LoadingDogList()),
    );

    blocTest<DogListCubit, DogListState>(
      'emits FetchedDogList after fetch',
      build: () {
        when(() => api.fetchAll()).thenAnswer((_) async => [(url: 'testDog')]);
        return DogListCubit(api: api);
      },
      act: (cubit) => cubit.fetchDogs(),
      expect: () => contains(
        isA<FetchedDogList>().having((s) => s.dogs, 'dogs', [(url: 'testDog')]),
      ),
    );

    blocTest<DogListCubit, DogListState>(
      'calls DogApi.fetchAll on fetch()',
      build: () {
        when(() => api.fetchAll()).thenAnswer((_) async => [(url: 'testDog')]);
        return DogListCubit(api: api);
      },
      act: (cubit) => cubit.fetchDogs(),
      verify: (_) => verify(() => api.fetchAll()).called(1),
    );
  });
}
