import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:week10_lecture/counter_bloc2.dart';

class SampleBlocMock extends MockBloc<SampleEvent, int> implements SampleBloc {}

void main() {
  group('CounterBloc', () {
    late SampleBlocMock sampleBlocMock;

    setUp(() {
      sampleBlocMock = SampleBlocMock();
    });

    blocTest(
      'emits [1] when CounterIncrementPressed is added',
      seed: () => 2,
      setUp: () {
        whenListen(sampleBlocMock, Stream.fromIterable([5, 6]));
      },
      build: () => CounterBloc(sampleBlocMock),
      expect: () => [3, 4],
    );
  });
}
