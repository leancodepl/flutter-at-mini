import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider((ref) => 0);

final counterProvider = StateNotifierProvider<CounterStateNotifier, int>(
  (_) => CounterStateNotifier(),
);

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier() : super(0);

  void increment() => state++;

  void decrement() => state--;
}
