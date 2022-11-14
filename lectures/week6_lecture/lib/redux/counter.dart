import 'package:redux/redux.dart';

enum CounterAction { increment, decrement }

class CounterStore extends Store<int> {
  CounterStore() : super(counterReducer, initialState: 0);

  static int counterReducer(int state, dynamic action) {
    if (action == CounterAction.increment) {
      return state + 1;
    }
    if (action == CounterAction.decrement) {
      return state - 1;
    }
    return state;
  }
}
