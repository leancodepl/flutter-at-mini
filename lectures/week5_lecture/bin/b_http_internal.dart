import 'package:http/http.dart' as http;

import 'common.dart';

Future<void> debugResponse(http.BaseResponse response) async {
  print('Status code: ${response.statusCode}');
  print('Reason phrase: ${response.reasonPhrase}');
  print('Content length: ${response.contentLength}');
  print('Headers:');
  response.headers.forEach((n, v) => print('\t$n = $v'));

  if (response is http.Response) {
    print('Body:');
    print(response.body);
  } else if (response is http.StreamedResponse) {
    print('Body:');
    print(await readAll(response.stream));
  } else {
    print('Unknown response type!');
  }
}
