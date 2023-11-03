import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'pokemon.dart';

Future<String> loadDataIOHttp() async {
  var client = HttpClient();
  try {
    var uri = Uri.parse(
      "https://flutter-at-mini.azurewebsites.net/api/Pokedex?multiply=100",
    );
    var req = await client.getUrl(uri);
    req.headers.removeAll("user-agent");
    req.headers.add("accept", "application/json");
    req.headers.add("user-agent", "Dart-Pokedex");
    var res = await req.close();

    // This works:
    // var str = await res.reduce((p, e) => p + e);
    // return String.fromCharCodes(str);

    // But this is faster
    return await res.transform(const Utf8Decoder()).reduce((p, e) => p + e);
  } finally {
    client.close(force: true);
  }
}

Future<String> loadDataHttpPackage() async {
  var uri = Uri.parse(
    "https://flutter-at-mini.azurewebsites.net/api/Pokedex?multiply=100",
  );
  var response = await http.get(uri, headers: {
    "accept": "application/json",
    "user-agent": "Dart-Pokedex",
  });
  return response.body;
}

Future<String> loadDataDio() async {
  var response = await Dio().get(
    "https://flutter-at-mini.azurewebsites.net/api/Pokedex?multiply=100",
    options: Options(
      headers: {
        "accept": "application/json",
        "user-agent": "Dart-Pokedex",
      },
    ),
  );
  return response.toString();
}

Future<Pokemon> loadPokemonSlow() async {
  // First task - load random pokemon from
  // https://flutter-at-mini.azurewebsites.net/api/Pokedex?multiply=100
  // using your library of choice.
  // Remember to pass `accept: application/json` and `user-agent: Dart-Pokedex` headers.
  //
  // Parse the response using Pokemons.fromResponse and then randomly pick a single pokemon

  // Three possible solutions:
  // var data = await loadDataIOHttp();
  // var data = await loadDataHttpPackage();
  var data = await loadDataDio();

  var pokemons = Pokemons.fromResponse(data);
  return pokemons.pokemons[Random().nextInt(pokemons.pokemons.length)];
}

Future<Pokemon> loadPokemonFastAndEasy() async {
  // Now, do the same but make it so that the spinner does not hang
  return compute((_) => loadPokemonSlow(), 0);
}

Future<Pokemon> loadPokemonFastAndComplex() async {
  // And now, make the same thing as in `_loadPokemonFastAndEasy` but with raw Isolates
  var recvPort = ReceivePort();
  Isolate.spawn((sendPort) async {
    var result = await loadPokemonSlow();
    sendPort.send(result);
  }, recvPort.sendPort);
  try {
    return await recvPort.first;
  } finally {
    recvPort.close();
  }
}
