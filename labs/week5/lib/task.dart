import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:week5/pokemon.dart';

final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100');

// Alternatively, with `dart:io`
Future<Pokemon> loadDataIOHttp() async {
  final client = HttpClient();
  try {
    final pokemonsReq = await client.getUrl(url);
    final pokemonsRes = await pokemonsReq.close();

    final pokemonsJson =
        await pokemonsRes.transform(const Utf8Decoder()).join();
    final pokemons =
        Pokemons.fromJson(jsonDecode(pokemonsJson) as Map<String, dynamic>);

    final random =
        pokemons.pokemons[Random().nextInt(pokemons.pokemons.length)];
    final pokemonReq = await client.getUrl(Uri.parse(random.url));
    final pokemonRes = await pokemonReq.close();
    final pokemonJson = await pokemonRes.transform(const Utf8Decoder()).join();
    return Pokemon.fromJson(jsonDecode(pokemonJson) as Map<String, dynamic>);
  } finally {
    client.close();
  }
}

// Alternatively, with `package:http`
Future<Pokemon> loadDataHttpPackage() async {
  final pokemonsRes = await http.get(url);
  final pokemons =
      Pokemons.fromJson(jsonDecode(pokemonsRes.body) as Map<String, dynamic>);

  final random = pokemons.pokemons[Random().nextInt(pokemons.pokemons.length)];
  final pokemonRes = await http.get(Uri.parse(random.url));
  return Pokemon.fromJson(jsonDecode(pokemonRes.body) as Map<String, dynamic>);
}

Future<Pokemon> loadPokemonSlow() async {
  // - Fetch pokémon entries from https://pokeapi.co/api/v2/pokemon?limit=100.
  // - Parse the response using Pokemons.fromJson
  // - Pick a random entry from the list
  // - Fetch the selected pokémon from its entry's url.
  // - Parse the response using Pokemon.fromJson and return it.
  final dio = Dio();
  final response = await dio.getUri<Map<String, dynamic>>(url);
  final pokemons = Pokemons.fromJson(response.data!);
  final random = pokemons.pokemons[Random().nextInt(pokemons.pokemons.length)];
  final pokemonResponse = await dio.get<Map<String, dynamic>>(random.url);
  return Pokemon.fromJson(pokemonResponse.data!);
}

Future<Pokemon> loadPokemonFastAndEasy() async {
  // Now, do the same but make it so that the spinner does not hang
  return compute((_) => loadPokemonSlow(), null);
}

Future<Pokemon> loadPokemonFastAndComplex() async {
  // And now, make the same thing as in `loadPokemonFastAndEasy` but with raw Isolates
  final receivePort = ReceivePort();
  await Isolate.spawn(
    (sendPort) async {
      final pokemon = await loadPokemonSlow();
      sendPort.send(pokemon);
    },
    receivePort.sendPort,
  );

  try {
    return await receivePort.first as Pokemon;
  } finally {
    receivePort.close();
  }
}
