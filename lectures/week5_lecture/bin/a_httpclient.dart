import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'a_httpclient_internal.dart';
import 'common.dart';

Future<void> simpleGet() async {
  final client = HttpClient();
  try {
    // Initiate a request - this opens the connection
    final request = await client.getUrl(anything);
    // Here, the underlying TCP connection is already opened but
    // the request has not been sent. We can configure it
    request.headers.add('We-Will', 'Rock You');

    // This line sends the request and reads (and buffers) the response
    final response = await request.close();

    // Now we have the response
    print('Status code: ${response.statusCode}');
    print('Reason phrase: ${response.reasonPhrase}');
    print('Content length: ${response.contentLength}');
    print('Headers:');
    response.headers.forEach((n, v) => print('\t$n = ${v.join('!')}'));

    // And we can read the body, but doing so is really cumbersome
    final data = await response.reduce((p, e) => p + e);
    final asString = String.fromCharCodes(data);
    print('Body:');
    print(asString);
  } finally {
    // And we need to remember to close the client, otherwise
    // we might leak native resources
    // `force` is just for fun here :)
    client.close(force: true);
  }
}

Future<void> harderPost() async {
  final client = HttpClient();
  try {
    final request = await client.postUrl(anything);

    // We can set the cookies
    request.cookies.add(Cookie('Steve', 'walkswarilydownthestreet'));

    // And set the body, aka. content, type
    request.headers.contentType = ContentType.text;
    request.headers.contentType = ContentType.json; // And we can update it

    // We don't need to send all at once
    request.write('{');

    // We can send chunks and flush in the process, as the data is buffered
    request.write('"another one": "bites the dust"');
    await request.flush();

    request.write('}');

    // But this will throw, as we've already sent (part of) the body :)
    // request.headers.contentType = ContentType.text;

    final response = await request.close();
    await debugResponse(response);
  } finally {
    client.close();
  }
}

Future<void> clientFailure() async {
  final client = HttpClient();
  try {
    // If the server sends a response, we _alway_ succeed
    final request = await client.getUrl(Uri.parse('$statusCode/404'));
    final response = await request.close();
    await debugResponse(response);
  } finally {
    client.close();
  }
}

Future<void> serverFailure() async {
  final client = HttpClient();
  try {
    // Really, always, no matter who made a mistake
    final request = await client.getUrl(Uri.parse('$statusCode/500'));
    final response = await request.close();
    await debugResponse(response);
  } finally {
    client.close();
  }
}

Future<void> networkFailure() async {
  final client = HttpClient();
  try {
    // EXCEPT when the error is "ambient"
    final request = await client.getUrl(invalidAddress);
    final response = await request.close();
    await debugResponse(response);
  } finally {
    client.close();
  }
}

Future<void> postJson() async {
  final client = HttpClient();
  try {
    final request = await client.postUrl(anything);

    // We need to say that it's JSON
    request.headers.contentType = ContentType.json;

    // We need to serialize data to JSON manually
    request.write(json.encode({
      "I": "want to",
      "break": "free",
    }));

    final response = await request.close();

    // And deserialize it on our own, probably skipping all the
    // streaming capabilities :(
    final deserialized = json.decode(await readAll(response));
    print('Body:');
    printPrettyJson(deserialized, indent: 2);
  } finally {
    client.close();
  }
}

Future<void> urlencoding() async {
  final client = HttpClient();
  try {
    final request = await client.postUrl(anything);

    request.headers.contentType = ContentType(
      'application',
      'x-www-form-urlencoded',
    );
    request.write(
      'allwehear=${Uri.encodeComponent('radio goo goo')}&'
      'radio=${Uri.encodeComponent('ga ga')}',
    );

    final response = await request.close();
    await debugResponse(response);
  } finally {
    client.close();
  }
}

Future<void> files() async {
  const kBoundary = 'NOESCAPEFROMREALITY';
  final client = HttpClient();
  try {
    final request = await client.postUrl(anything);

    request.headers.contentType = ContentType(
      'multipart',
      'form-data',
      parameters: {'boundary': kBoundary},
    );
    request.writeAll(
      [
        '--$kBoundary',
        'Content-Disposition: form-data; name="test"; filename="test.json"',
        'Content-Type: application/json',
        '',
        '{"Is this the real life": "Is this just fantasy"}',
        '--$kBoundary--',
      ],
      '\r\n',
    );

    final response = await request.close();
    await debugResponse(response);
  } finally {
    client.close();
  }
}
