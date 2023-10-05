import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom.g.dart';

@JsonSerializable()
class Custom {
  Custom(this.field1, this.field3, this.field4, this.status);
  factory Custom.fromJson(Map<String, dynamic> json) => _$CustomFromJson(json);

  @JsonKey(name: 'different_name')
  final int field1;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String field2 = 'internal field';

  @JsonKey(defaultValue: '')
  final String field3;

  @JsonKey(fromJson: int.parse, toJson: toString)
  final int field4;

  final Status status;

  Map<String, dynamic> toJson() => _$CustomToJson(this);
}

enum Status {
  pending,
  completed,
  @JsonValue(-1)
  failed
}

String toString(Object? obj) => obj.toString();

void main() {
  const jsonStr = '''
    {
      "different_name": 890,
      "field3": null,
      "status": "pending",
      "field4": "123"
    }''';

  final parsed = jsonDecode(jsonStr);
  print('parsed: $parsed');

  final custom = Custom.fromJson(parsed as Map<String, dynamic>);

  print('toJson: ${custom.toJson()}');

  print(_$StatusEnumMap);
}
