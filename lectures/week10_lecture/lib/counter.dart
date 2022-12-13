import 'package:flutter_bloc/flutter_bloc.dart';

class Counter {
  int _value = 0;

  int get value => _value;

  void increment() => _value++;
  void decrement() => _value--;
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
