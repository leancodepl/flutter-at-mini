import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:week11_lecture/code_generation/freezed/person.dart';

part 'person_state.freezed.dart';

@freezed
class PersonState with _$PersonState {
  const factory PersonState.success(Person person) = _Success;

  const factory PersonState.error(String errorText) = _Error;

  const factory PersonState.loading() = _Loading;
}
