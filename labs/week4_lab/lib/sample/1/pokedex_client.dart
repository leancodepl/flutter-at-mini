import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:week4_lab/exercise/pokemon_info.dart';
import 'package:week4_lab/sample/1/pokemon_response.dart';

class PokedexClient {
  final _baseUrl = 'https://pokeapi.co/api/v2/pokemon';
  String _nextPage = '';

  Future<PokemonResponse> getFirstPokemonsPage() async {
    final uri = Uri.parse(_baseUrl + '?offset=0&limit=20');
    final response = await http.get(uri, headers: {});

    return _handleResponse(response);
  }

  // step 3
  Future<PokemonResponse> getNextPokemonsPage() async {
    final uri = Uri.parse(_nextPage);
    final response = await http.get(uri, headers: {});

    return _handleResponse(response);
  }

  PokemonResponse _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      final pokemonResponse =
          PokemonResponse.success(jsonDecode(response.body));
      _nextPage = pokemonResponse.next;
      return pokemonResponse;
    } else {
      return PokemonResponse.error();
    }
  }

  // exercise

  Future<PokemonInfo> getPokemonInfo(String url) async {
    final response = await http.get(Uri.parse(url), headers: {});

    if (response.statusCode == 200) {
      return PokemonInfo.fromJson(jsonDecode(response.body));
    } else {
      throw UnimplementedError();
    }
  }
}
