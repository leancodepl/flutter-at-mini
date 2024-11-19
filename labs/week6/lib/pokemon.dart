/// 1. JSON
///    Make the classes in this file deserializable from JSON.
///    Use the `json_serializable` package.
///    *Don't generate `toJson` methods.*
///
/// 2. Value-based equality
///    Define value-based equality for the classes in this file.
///    Use the `equatable` package.
library;

class Pokemons {
  Pokemons({required this.pokemons});

  final List<PokemonEntry> pokemons;
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
