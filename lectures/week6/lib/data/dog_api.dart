import 'dart:convert';

import 'package:week6/data/dog.dart';
import 'package:http/http.dart';

class DogApi {
  final _uri = Uri.parse('https://dog.ceo/api/breed/corgi/images/random/50');

  Future<List<Dog>> fetchAll() async {
    final res = await get(_uri);
    final body = json.decode(res.body);

    print(body);

    return (body['message'] as List)
        .cast<String>()
        .map((url) => (url: url))
        .toList();
  }
}
