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
