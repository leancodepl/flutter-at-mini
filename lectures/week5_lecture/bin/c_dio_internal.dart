import 'package:dio/dio.dart';

import 'common.dart';

void debugResponse<T>(Response<T> response) {
  print('Status code: ${response.statusCode}');
  print('Reason phrase: ${response.statusMessage}');
  print('Content length: ${response.headers['Content-Length']}');
  print('Headers:');
  response.headers.forEach((n, v) => print('\t$n = ${v.join(',')}'));
  
  print('Body:');
  printPrettyJson(response.data);
}