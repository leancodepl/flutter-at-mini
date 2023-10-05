import 'dart:convert';

import 'package:http/http.dart' as http;

import 'matches_models.dart';

class MatchesRepository {
  // https://github.com/estiens/world_cup_json
  static const _baseUrl = 'https://worldcupjson.net/matches';

  final client = http.Client();

  Future<List<Match>> fetchMatches() async {
    final response = await client.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Match.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Could not load matches');
    }
  }
}
