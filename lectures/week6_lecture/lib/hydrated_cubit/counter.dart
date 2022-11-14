import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterHydratedCubit extends HydratedCubit<int> {
  CounterHydratedCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  int? fromJson(Map<String, dynamic> json) => json['count'];

  @override
  Map<String, dynamic>? toJson(int state) => {'count': state};
}
