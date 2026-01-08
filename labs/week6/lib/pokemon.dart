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
  const Pokemons({required this.pokemons, required this.count});

  final List<PokemonEntry> pokemons;
  final int count;
}

class PokemonEntry {
  const PokemonEntry({required this.name, required this.url});

  final String name;
  final String url;
}

class Pokemon {
  const Pokemon({
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
