import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';

import 'c_dio_internal.dart';
import 'common.dart';

Future<void> simpleGet() async {
  // Do the whole request _in a single call_
  final response = await Dio().getUri(
    anything,
    options: Options(
      headers: {
        'Mmmmmhhh-mhmm': 'yeah yeah',
      },
    ),
  );

  // We have all the common fields available
  print('Status code: ${response.statusCode}');
  // But ofc nothing can be perfect :)
  print('Reason phrase: ${response.statusMessage}');
  // But at least nothing is "promoted" artificially
  print('Content length: ${response.headers['Content-Length']}');
  print('Headers:');

  // Proper header handling
  response.headers.forEach((n, v) => print('\t$n = ${v.join(',')}'));

  // And body is easily available, with a catch :)
  print('Body:');
  // `data` is a `dynamic` and depends on options passed to the request
  print(response.data.toString());
}

Future<void> simpleGetFixed() async {
  // We should do it this way, although Dio examples use `Dio()` everywhere
  // because we leak HTTP connections (notice the delay after the last line
  // is printed)
  final dio = Dio();
  try {
    final response = await dio.getUri(
      anything,
      options: Options(
        headers: {
          'Youve-Been': 'down too long in the midnight sea',
        },
      ),
    );

    debugResponse(response);
  } finally {
    dio.close();
  }
}

Future<void> harderPost() async {
  final response = await Dio().postUri(
    anything,
    options: Options(
      headers: {
        // No proper cookie handling in the base
        // But there is dio_cookie_manager just for that :)
        'Set-Cookie': 'time=alongassfuckingtimeago',
      },
      // We can set the content type, but Dio is able to manage it itself
      // However, it will listen to us and not override it!
      contentType: Headers.jsonContentType,
    ),
    data: <String, String>{
      // We can use maps and leave serialization to the library :D
      'Dio can you hear me': 'I am lost and so alone',
    },
  );

  // Also, it is worth noting that the response is _also_ deserialized
  // According to content-type (if supported - JSON is :) )
  debugResponse(response);
}

Future<void> clientFailure() async {
  // FINALLY! Consistent approach to error handling!
  final response = await Dio().get('$statusCode/404');
  debugResponse(response);
}

Future<void> serverFailure() async {
  // :)
  final response = await Dio().get('$statusCode/500');
  debugResponse(response);
}

Future<void> networkFailure() async {
  // :D
  final response = await Dio().getUri(invalidAddress);
  debugResponse(response);
}

Future<void> urlencoding() async {
  // Just like that - specify the content type, Dio will manage
  // it for you
  final response = await Dio().postUri(
    anything,
    options: Options(contentType: Headers.formUrlEncodedContentType),
    data: {
      'Youwatchtheirfaces':
          'You\'ll see the traces of the things they want to be',
    },
  );
  debugResponse(response);
}

Future<void> postJson() async {
  // We can specify the `data` type in result
  // `Map<String, dynamic>` will be intepreted as JSON response
  final response = await Dio().postUri<Map<String, dynamic>>(
    anything,
    data: {
      'We\'ll know': 'for the first time',
      'Ifwere': 'evil or divine',
    },
  );

  debugResponse(response);
}

Future<void> files() async {
  // Easily add files, even easier than in `http` (which was nice)
  final data = FormData()
    ..files.add(
      MapEntry(
        '1',
        MultipartFile.fromString('No sign of the morning coming'),
      ),
    )
    ..files.add(
      MapEntry(
        '2',
        MultipartFile.fromString('You\'ve been left on your own'),
      ),
    );
  final response = await Dio().postUri(anything, data: data);
  debugResponse(response);
}

Future<void> advanced1() async {
  // Dio supports cancellations using tokens
  final token = CancelToken();
  // Cancel the token after 0.5s
  Timer(const Duration(milliseconds: 500), token.cancel);

  // And do a query that will take more than 0.5s :)
  final response = await Dio().get('$delay/2', cancelToken: token);
  debugResponse(response);
}

Future<void> advanced2() async {
  // Dio supports (easily) HTTP2 if available
  final dio = Dio()..httpClientAdapter = Http2Adapter(ConnectionManager());
  try {
    final response = await dio.getUri(anything);
    debugResponse(response);
  } finally {
    // But it's better to manage Dio lifecycle yourself
    // As HTTP2 connections are quite long-living
    dio.close(force: true);
  }
}

Future<void> advanced3() async {
  // Dio also supports `interceptor`, which allow you to do
  // things with request/response withouth being too explicit
  // everywhere. Like, logging :)
  final dio = Dio()..interceptors.add(LogInterceptor());
  try {
    final response = await dio.getUri(anything);
    print('The text above is printed directly by Dio');
    print('');
    debugResponse(response);
  } finally {
    dio.close(force: true);
  }
}

Future<void> advanced4() async {
  // Streaming is also easy
  final response = await Dio().postUri(
    anything,
    data: _produceStreamedBody(),
    options: Options(
      headers: {HttpHeaders.contentLengthHeader: 67},
    ),
  );
  // But the response does not need to be streamed (but ca be, no worries here)
  debugResponse(response);

  // Please note that if you accidentaly calculate length wrongly,
  // The program will fail terribly :)
}

Stream<List<int>> _produceStreamedBody() async* {
  await Future.delayed(const Duration(milliseconds: 500));
  yield utf8.encode('Don\'t hide in doorways');
  await Future.delayed(const Duration(milliseconds: 100));
  yield utf8.encode('\n');
  await Future.delayed(const Duration(milliseconds: 100));
  yield utf8.encode('You may find the key that opens up your soul');
  await Future.delayed(const Duration(milliseconds: 500));
}
