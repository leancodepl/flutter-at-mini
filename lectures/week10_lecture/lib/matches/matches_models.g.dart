// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
      id: json['id'] as int,
      venue: json['venue'] as String,
      location: json['location'] as String,
      status: json['status'] as String,
      awayTeam: Team.fromJson(json['away_team'] as Map<String, dynamic>),
      homeTeam: Team.fromJson(json['home_team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'id': instance.id,
      'venue': instance.venue,
      'location': instance.location,
      'status': instance.status,
      'away_team': instance.awayTeam,
      'home_team': instance.homeTeam,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      country: json['country'] as String,
      name: json['name'] as String,
      goals: json['goals'] as int?,
      penalties: json['penalties'] as int?,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'country': instance.country,
      'name': instance.name,
      'goals': instance.goals,
      'penalties': instance.penalties,
    };
