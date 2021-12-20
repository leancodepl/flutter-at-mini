import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
// part 'person.g.dart';

@freezed
class Person with _$Person {
  @Assert('age >= 0')
  factory Person({ required String name, @Default(18) int age }) = _Person;

  // factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
