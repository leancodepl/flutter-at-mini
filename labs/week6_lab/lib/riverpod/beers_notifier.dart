import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:week6_lab/beer.dart';

final beersProvider = FutureProvider.autoDispose<List<Beer>>((ref) async {
  final _uri = Uri.parse('https://api.sampleapis.com/beers/ale');
  final res = await http.get(_uri);

  final json = (jsonDecode(res.body) as List).cast<Map<String, dynamic>>();
  return json.map(Beer.fromJson).toList();
});
