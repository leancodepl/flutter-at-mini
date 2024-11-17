import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:week6/data/dog.dart';

class DogApi {
  final _uri = Uri.parse('https://dog.ceo/api/breed/corgi/images/random/50');

  Future<List<Dog>> fetchAll() async {
    final res = await get(_uri);
    final body = json.decode(res.body) as Map<String, dynamic>;

    debugPrint(body.toString());

    return (body['message'] as List)
        .cast<String>()
        .map((url) => (url: url))
        .toList();
  }
}
