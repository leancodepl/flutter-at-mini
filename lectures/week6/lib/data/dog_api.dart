import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:week6/data/dog.dart';

class DogApi {
  final _uri = Uri.parse('https://dog.ceo/api/breed/corgi/images/random/50');

  List<Dog>? _cache;

  Future<List<Dog>> fetchAll() async {
    if (_cache != null) {
      debugPrint('DogApi: returning cached dogs');
      return _cache!;
    }

    debugPrint('DogApi: fetching dogs from network');
    final res = await get(_uri);
    final body = json.decode(res.body) as Map<String, dynamic>;

    final dogs = (body['message'] as List)
        .cast<String>()
        .map((url) => (url: url))
        .toList();

    _cache = dogs;
    return dogs;
  }

  void clearCache() {
    debugPrint('DogApi: cache cleared');
    _cache = null;
  }
}
