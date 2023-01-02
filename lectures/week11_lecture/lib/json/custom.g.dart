// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Custom _$CustomFromJson(Map<String, dynamic> json) => Custom(
      json['different_name'] as int,
      json['field3'] as String? ?? '',
      int.parse(json['field4'] as String),
      $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$CustomToJson(Custom instance) => <String, dynamic>{
      'different_name': instance.field1,
      'field3': instance.field3,
      'field4': toString(instance.field4),
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.pending: 'pending',
  Status.completed: 'completed',
  Status.failed: -1,
};
