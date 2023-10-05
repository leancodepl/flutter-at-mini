// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['Name'] as String,
      json['Email'] as String,
      json['Age'] as int,
      isAdmin: json['IsAdmin'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Name': instance.name,
      'Email': instance.email,
      'Age': instance.age,
      'IsAdmin': instance.isAdmin,
    };
