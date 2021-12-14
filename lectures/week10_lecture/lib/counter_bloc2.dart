import 'package:bloc/bloc.dart';

abstract class CounterEvent {}
class CounterIncrementPressed extends CounterEvent {}
class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  final SampleBloc sampleBloc;
  CounterBloc(this.sampleBloc) : super(0) {
    sampleBloc.stream.listen((event) {
      add(CounterIncrementPressed());
    });
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
}


abstract class SampleEvent {}
class TestSampleEvent extends SampleEvent {}

class SampleBloc extends Bloc<SampleEvent, int> {
  SampleBloc() : super(0) {
    on<TestSampleEvent>((event, emit) => emit(state + 5));
  }
}


