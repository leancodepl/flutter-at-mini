import 'dart:async';
import 'dart:io';

import 'common.dart';

Future<void> debugResponse(HttpClientResponse response) async {
  print('Status code: ${response.statusCode}');
  print('Reason phrase: ${response.reasonPhrase}');
  print('Content length: ${response.contentLength}');
  print('Headers:');
  response.headers.forEach((n, v) => print('\t$n = ${v.join('!')}'));
  final body = await readAll(response);
  print('Body:');
  print(body);
}
