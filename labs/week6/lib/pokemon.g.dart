// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemons _$PokemonsFromJson(Map<String, dynamic> json) => Pokemons(
  pokemons: (json['results'] as List<dynamic>)
      .map((e) => PokemonEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$PokemonsToJson(Pokemons instance) => <String, dynamic>{
  'results': instance.pokemons,
  'count': instance.count,
};

PokemonEntry _$PokemonEntryFromJson(Map<String, dynamic> json) =>
    PokemonEntry(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$PokemonEntryToJson(PokemonEntry instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  baseExperience: (json['base_experience'] as num).toInt(),
  height: (json['height'] as num).toInt(),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'base_experience': instance.baseExperience,
  'height': instance.height,
  'weight': instance.weight,
};
