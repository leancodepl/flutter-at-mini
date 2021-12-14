import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:week10_lecture/counter_bloc.dart';

// Source: https://bloclibrary.dev/#/testing
void main() {
  group('CounterBloc', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test('initial state is 0', () {
      expect(counterBloc.state, 0);
    });

    blocTest(
      'emits [1] when CounterIncrementPressed is added',
      build: () => counterBloc,
      act: (CounterBloc bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => [1],
    );

    blocTest(
      'emits [-1] when CounterDecrementPressed is added',
      build: () => counterBloc,
      act: (CounterBloc bloc) => bloc.add(CounterDecrementPressed()),
      expect: () => [-1],
    );
  });
}



