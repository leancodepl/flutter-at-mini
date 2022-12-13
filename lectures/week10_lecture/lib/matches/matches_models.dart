import 'package:json_annotation/json_annotation.dart';

part 'matches_models.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Match {
  Match({
    required this.id,
    required this.venue,
    required this.location,
    required this.status,
    required this.awayTeam,
    required this.homeTeam,
  });

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  final int id;
  final String venue;
  final String location;
  final String status;
  final Team awayTeam;
  final Team homeTeam;

  Map<String, dynamic> toJson() => _$MatchToJson(this);

  bool get finishedWithPenalties =>
      (homeTeam.penalties != 0 || awayTeam.penalties != 0) &&
      homeTeam.goals != null;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Team {
  Team({
    required this.country,
    required this.name,
    required this.goals,
    required this.penalties,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  final String country;
  final String name;
  final int? goals;
  final int? penalties;

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
