import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'b_http_internal.dart';
import 'common.dart';

Future<void> simpleGet() async {
  // Do the whole request _in a single call_
  final response = await http.get(
    anything,
    headers: {
      'Tonight': 'we\'re summoned for a divine cause',
    },
  );

  // We have all the common fields available
  print('Status code: ${response.statusCode}');
  print('Reason phrase: ${response.reasonPhrase}');
  print('Content length: ${response.contentLength}');
  print('Headers:');

  // THIS IS WRONG - headers don't need to be unique but this model
  // assumes that they are. They are concatenated underneath with ','.
  // This is allowed by the HTTP spec but the client _forces_
  // this desing, whereas HTTP only _allows_ it.
  response.headers.forEach((n, v) => print('\t$n = $v'));

  // And body is easily available :)
  print('Body:');
  print(response.body);
}

Future<void> harderPost() async {
  final response = await http.post(
    anything,
    headers: {
      // No proper cookie handling :(
      'Set-Cookie': 'hidingfromthelight=sacrificingnothing',

      // We can't set it when we set `body` to a Map
      // 'Content-Type': 'application/json',
    },
    body: <String, String>{
      // We can use maps and leave serialization to the library :D
      'Are you on the square?': 'Are you on the level?',
    },
  );

  await debugResponse(response);
  // But there's a catch...
}

Future<void> harderPostCorrect() async {
  // `http` does not know about JSON :)
  final response = await http.post(
    anything,
    headers: {
      // No proper cookie handling :(
      'Set-Cookie': 'justwannabe=wannabewitchyou',

      'Content-Type': 'application/json',
    },
    body: '{ "It keeps on giving me chills": "But I know now" }',
  );

  await debugResponse(response);
}

Future<void> clientFailure() async {
  // Same behavior as `HttpClient`
  final response = await http.get(Uri.parse('$statusCode/404'));
  await debugResponse(response);
}

Future<void> serverFailure() async {
  // Same behavior
  final response = await http.get(Uri.parse('$statusCode/500'));
  await debugResponse(response);
}

Future<void> networkFailure() async {
  // Same here
  final response = await http.get(invalidAddress);
  await debugResponse(response);
}

Future<void> urlencoding() async {
  // Yep, it's that simple
  final response = await http.post(
    anything,
    body: {
      'Youvebeenplayinaround': 'with magic that is black',
      'But all the powerful magical':
          'mysteries never give a single thing back',
    },
  );
  await debugResponse(response);
}

Future<void> postJson() async {
  final response = await http.post(
    anything,
    headers: {
      // We need to specify that it's JSON
      'Content-Type': 'application/json; charset=utf-8',
    },
    // And serialize on our own
    body: json.encode({
      'Can you hear the rumble?': 'Can you hear the rumble that\'s calling?',
    }),
  );

  // And deserialize on our own, again - with no streaming
  final deserialized = json.decode(response.body);
  print('Body:');
  printPrettyJson(deserialized, indent: 2);
}

Future<void> files() async {
  final request = http.MultipartRequest('POST', anything)
    ..files.add(
      http.MultipartFile.fromString(
        'test',
        '{"You\'ll soon be hearing the chime": "Close to midnight"}',
        contentType: MediaType('application', 'json'),
      ),
    );

  // `response` here is a StreamedResponse - meaning that we don't
  // buffer (i.e. copy fully to memory) the output.
  final response = await request.send();

  await debugResponse(response);
}

Future<void> advanced1() async {
  // We can use `Client` to wrap it, adding new functionality,
  // or control the resources used by scoping it the way we
  // want.
  final client = http.Client();
  try {
    final response = await client.get(anything);
    debugResponse(response);
  } finally {
    client.close();
  }
}

Future<void> advanced2() async {
  // We can use streaming requests
  final request = http.StreamedRequest('POST', anything)
    ..contentLength = 37; // We should set the length manually

// Schedule writing using streams
  _produceStreamedBody().listen(
    (e) => request.sink.add(e),
    onDone: () => request.sink.close(),
  );

  // We send the request although we haven't yet sent the body!
  // It will wait for the response to be available
  final response = await request.send();
  // But read only headers, allowing us to read body manually
  // `response` is `StreamedResponse` here
  await debugResponse(response);

  // It also works with `Client` using `Client.send`
}

Stream<List<int>> _produceStreamedBody() async* {
  await Future.delayed(const Duration(milliseconds: 500));
  yield utf8.encode('You have the power');
  await Future.delayed(const Duration(milliseconds: 100));
  yield utf8.encode('\n');
  await Future.delayed(const Duration(milliseconds: 100));
  yield utf8.encode('You wear the crown');
  await Future.delayed(const Duration(milliseconds: 500));
}
