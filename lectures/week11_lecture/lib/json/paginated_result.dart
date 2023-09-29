import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:week11_lecture/json/user.dart';

part 'paginated_result.g.dart';

// We must declare support for generics
@JsonSerializable(genericArgumentFactories: true)
class PaginatedResult<T> {
  const PaginatedResult(this.items, this.info);

  factory PaginatedResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResultFromJson(json, fromJsonT);

  final List<T> items;
  final PaginationInfo info; // you can nest json-serializable objects

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) =>
      _$PaginatedResultToJson(this, toJsonT);
}

@JsonSerializable()
class PaginationInfo {
  const PaginationInfo(this.page, this.nextPageKey, this.prevPageKey);
  factory PaginationInfo.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoFromJson(json);

  final int page;
  final String? nextPageKey;
  final String? prevPageKey;

  Map<String, dynamic> toJson() => _$PaginationInfoToJson(this);
}

void main() {
  const jsonStr = '''
    {
      "info": {
        "page": 0,
        "prevPageKey": null,
        "nextPageKey": "b3a91745-fab2-4c14-b834-c953831507c4"
      },
      "items": [
        {
          "Name": "Marcin",
          "Email": "marcin.wojnarowski@leancode.pl",
          "Age": 23,
          "IsAdmin": false
        }
      ]
    }''';

  final parsed = jsonDecode(jsonStr);
  print('parsed: $parsed');

  final user = PaginatedResult<User>.fromJson(
    parsed as Map<String, dynamic>,
    (json) => User.fromJson(json! as Map<String, dynamic>),
  );

  print('toJson: ${user.toJson((user) => user.toJson())}');
}
