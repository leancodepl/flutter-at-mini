// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResult<T> _$PaginatedResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedResult<T>(
      (json['items'] as List<dynamic>).map(fromJsonT).toList(),
      PaginationInfo.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginatedResultToJson<T>(
  PaginatedResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items.map(toJsonT).toList(),
      'info': instance.info,
    };

PaginationInfo _$PaginationInfoFromJson(Map<String, dynamic> json) =>
    PaginationInfo(
      json['page'] as int,
      json['nextPageKey'] as String?,
      json['prevPageKey'] as String?,
    );

Map<String, dynamic> _$PaginationInfoToJson(PaginationInfo instance) =>
    <String, dynamic>{
      'page': instance.page,
      'nextPageKey': instance.nextPageKey,
      'prevPageKey': instance.prevPageKey,
    };
