import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:week6_lab/beer.dart';

class BeersNotifier extends ChangeNotifier {
  List<Beer> beers = [];
  bool loading = false;

  final _uri = Uri.parse('https://api.sampleapis.com/beers/ale');

  Future<void> fetch() async {
    loading = true;
    notifyListeners();

    final res = await http.get(_uri);

    final json = (jsonDecode(res.body) as List).cast<Map<String, dynamic>>();
    beers = json.map(Beer.fromJson).toList();
    loading = false;

    notifyListeners();
  }
}
