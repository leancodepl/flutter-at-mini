import 'dart:async';

import 'dart:convert';

final anything = Uri.parse('https://httpbin.org/anything');
final statusCode = Uri.parse('https://httpbin.org/status');
final invalidAddress =
    Uri.parse('https://thisdoesnotresolve.toanything.leancode.dev');
final delay = Uri.parse('https://httpbin.org/delay');

Future<String> readAll(Stream<List<int>> response) async {
  final completer = Completer<String>();
  final result = StringBuffer();
  response.transform(utf8.decoder).listen(
        (d) => result.write(d),
        onDone: () {
          if (!completer.isCompleted) {
            completer.complete(result.toString());
          }
        },
        onError: (e) => completer.completeError(e),
      );
  return completer.future;
}

String prettyJson(dynamic json, {int indent = 2}) {
  var spaces = ' ' * indent;
  var encoder = JsonEncoder.withIndent(spaces);
  return encoder.convert(json);
}

void printPrettyJson(dynamic json, {int indent = 2}) {
  print(prettyJson(json, indent: indent));
}
