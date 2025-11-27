/// 1. JSON
///    Make the classes in this file deserializable from JSON.
///    ***Don't generate `toJson` methods as they're not needed.***
///    Use the `json_serializable` package:
///    https://pub.dev/packages/json_serializable
///
/// 2. Value-based equality
///    Define value-based equality for the classes in this file.
///    Use the `equatable` package:
///    https://pub.dev/packages/equatable
library;

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemons with EquatableMixin {
  const Pokemons({required this.pokemons, required this.count});

  factory Pokemons.fromJson(Map<String, dynamic> json) =>
      _$PokemonsFromJson(json);

  @JsonKey(name: 'results')
  final List<PokemonEntry> pokemons;
  final int count;

  @override
  List<Object?> get props => [pokemons, count];
}

@JsonSerializable()
class PokemonEntry with EquatableMixin {
  const PokemonEntry({required this.name, required this.url});

  factory PokemonEntry.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntryFromJson(json);

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Pokemon with EquatableMixin {
  const Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;

  @override
  List<Object?> get props => [id, name, baseExperience, height, weight];
}
