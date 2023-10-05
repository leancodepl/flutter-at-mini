import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
sealed class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState.initial() = InitialState<T>;
  const factory AsyncState.loading() = LoadingState<T>;
  const factory AsyncState.result(T data) = ResultState<T>;
}
