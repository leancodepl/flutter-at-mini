import 'package:bloc/bloc.dart';
import 'package:week6/bloc/balance_event.dart';
import 'package:week6/bloc/balance_state.dart';

// Similar to https://pub.dev/packages/bloc_concurrency
EventTransformer<E> sequential<E>() {
  return (events, mapper) => events.asyncExpand(mapper);
}

class ConcurrentBalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  ConcurrentBalanceBloc() : super(const BalanceState(balance: 0)) {
    on<IncrementPressed>(_onIncrement);
  }

  Future<void> _onIncrement(
    IncrementPressed event,
    Emitter<BalanceState> emit,
  ) async {
    final current = state.balance;
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(state.copyWith(balance: current + 1));
  }
}

class SequentialBalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  SequentialBalanceBloc() : super(const BalanceState(balance: 0)) {
    on<IncrementPressed>(_onIncrement, transformer: sequential());
  }

  Future<void> _onIncrement(
    IncrementPressed event,
    Emitter<BalanceState> emit,
  ) async {
    final current = state.balance;
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(state.copyWith(balance: current + 1));
  }
}
