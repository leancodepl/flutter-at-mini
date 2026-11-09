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

class const Pokemons({
  // This field is called `results` in the JSON.
  required final List<PokemonEntry> pokemons,
  required final int count,
});

class const PokemonEntry({
  required final String name,
  required final String url,
});

class const Pokemon({
  required final int id,
  required final String name,
  required final int baseExperience,
  required final int height,
  required final int weight,
});
