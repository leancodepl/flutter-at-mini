import 'package:flutter/foundation.dart';

class CounterValueNotifier extends ValueNotifier<int> {
  CounterValueNotifier() : super(0);

  void increment() => value++;
  void decrement() => value--;
}
