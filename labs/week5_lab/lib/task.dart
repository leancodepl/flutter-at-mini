import 'pokemon.dart';

Future<Pokemon> loadPokemonSlow() async {
  // First task - load random pokemon from
  // https://flutter-at-mini.azurewebsites.net/api/Pokedex?multiply=100
  // using your library of choice.
  // Remember to pass `accept = application/json` and `user-agent = Dart-Pokedex` headers.
  //
  // Parse the response using Pokemons.fromResponse and then randomly pick a single pokemon
  return Pokemon.empty();
}

Future<Pokemon> loadPokemonFastAndEasy() async {
  // Now, do the same but make it so that the spinner does not hang
  return Pokemon.empty();
}

Future<Pokemon> loadPokemonFastAndComplex() async {
  // And now, make the same thing as in `_loadPokemonFastAndEasy` but with raw Isolates
  return Pokemon.empty();
}
