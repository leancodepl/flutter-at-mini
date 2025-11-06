import 'package:week5/pokemon.dart';

Future<Pokemon> loadPokemonSlow() async {
  // - Fetch pokémon entries from https://pokeapi.co/api/v2/pokemon?limit=100.
  // - Parse the response using Pokemons.fromJson
  // - Pick a random entry from the list
  // - Fetch the selected pokémon from its entry's url.
  // - Parse the response using Pokemon.fromJson and return it.
  throw UnimplementedError();
}

Future<Pokemon> loadPokemonFastAndEasy() async {
  // Now, do the same but make it so that the spinner does not hang
  throw UnimplementedError();
}

Future<Pokemon> loadPokemonFastAndComplex() async {
  // And now, make the same thing as in `loadPokemonFastAndEasy` but with raw Isolates
  throw UnimplementedError();
}
