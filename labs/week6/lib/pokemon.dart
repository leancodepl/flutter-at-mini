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

class Pokemons {
  Pokemons({
    required this.pokemons,
    required this.next,
    required this.count,
  });

  // This field is called `results` in the JSON.
  final List<PokemonEntry> pokemons;
  final Uri next;
  final int count;
}

class PokemonEntry {
  PokemonEntry({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
  });

  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
}
