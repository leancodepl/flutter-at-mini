import 'package:week4_lab/sample/1/pokemon.dart';

class PokemonResponse {
  late final List<Pokemon> pokemons;
  late final bool isError;
  late final String next;

  PokemonResponse.success(Map<String, dynamic> json) {
    isError = false;
    next = json['next'];
    final list = json['results'] as List;
    pokemons = list.map((i) => Pokemon.fromJson(i)).toList();
  }

  PokemonResponse.error()
      : pokemons = List.empty(),
        isError = true,
        next = '';
}
