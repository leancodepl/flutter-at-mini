class Pokemons {
  Pokemons({required this.pokemons});

  Pokemons.fromJson(Map<String, dynamic> json) : pokemons = [] {
    if (json case {'results': final elements as List}) {
      for (final (i, json as Map) in elements.indexed) {
        pokemons.add(PokemonEntry.fromJson(json.cast()));

        if (i % 10 == 0) {
          // We're doing *a lot* of work here :)
          final sw = Stopwatch()..start();
          while (sw.elapsedMilliseconds < 100) {}
        }
      }
    }
  }

  final List<PokemonEntry> pokemons;
}

class PokemonEntry {
  PokemonEntry({
    required this.name,
    required this.url,
  });

  PokemonEntry.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        url = json['url'] as String;

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

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        baseExperience = json['base_experience'] as int,
        height = json['height'] as int,
        weight = json['weight'] as int;

  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
}
