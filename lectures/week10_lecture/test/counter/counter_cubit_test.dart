import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/counter.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    test('initial state is 0', () {
      expect(counterCubit.state, 0);
    });

    blocTest<CounterCubit, int>(
      'emits [1] when CounterEvent.increment is added',
      build: () => counterCubit,
      act: (bloc) => bloc.increment(),
      expect: () => [1],
    );

    blocTest<CounterCubit, int>(
      'emits [-1] when CounterEvent.decrement is added',
      build: () => counterCubit,
      act: (bloc) => bloc.decrement(),
      expect: () => [-1],
    );
  });
}
