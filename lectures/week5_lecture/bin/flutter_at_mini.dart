import 'a_httpclient.dart' as a;
import 'b_http.dart' as b;
import 'c_dio.dart' as c;

class Example {
  static const _kSep = '=';
  static const _kSepLen = 30;

  final String name;
  final String searchBy;
  final Future<void> Function() action;

  Example(this.name, this.action) : searchBy = name.toLowerCase();

  Future<void> run() async {
    _adorn(name);
    final sw = Stopwatch()..start();
    try {
      await action();
      sw.stop();
    } catch (e) {
      sw.stop();
      _adorn('Exception', '!');
      print(e);
    }
    _adorn(sw.elapsed.toString());
    print('');
  }

  static void _adorn(String what, [String c = _kSep]) {
    final padLeft = ((_kSepLen - what.length - 2) / 2).floor();
    final padRight = ((_kSepLen - what.length - 2) / 2).ceil();
    print('${c * padLeft} $what ${c * padRight}');
  }
}

final examples = [
  // dart:io-based
  Example('HttpClient.get', a.simpleGet),
  Example('HttpClient.post', a.harderPost),
  Example('HttpClient.client', a.clientFailure),
  Example('HttpClient.server', a.serverFailure),
  Example('HttpClient.network', a.networkFailure),
  Example('HttpClient.urlencoding', a.urlencoding),
  Example('HttpClient.json', a.postJson),
  Example('HttpClient.files', a.files),
  // No `advanced` here - files are advanced enough :)

  // http-based
  Example('http.get', b.simpleGet),
  Example('http.post', b.harderPost),
  Example('http.postCorrect', b.harderPostCorrect),
  Example('http.client', b.clientFailure),
  Example('http.server', b.serverFailure),
  Example('http.network', b.networkFailure),
  Example('http.urlencoding', b.urlencoding),
  Example('http.json', b.postJson),
  Example('http.files', b.files),
  Example('http.advanced1', b.advanced1),
  Example('http.advanced2', b.advanced2),

  // dio-based
  Example('dio.get', c.simpleGet),
  Example('dio.getFixed', c.simpleGetFixed),
  Example('dio.post', c.harderPost),
  Example('dio.client', c.clientFailure),
  Example('dio.server', c.serverFailure),
  Example('dio.network', c.networkFailure),
  Example('dio.urlencoding', c.urlencoding),
  Example('dio.json', c.postJson),
  Example('dio.files', c.files),
  Example('dio.advanced1', c.advanced1),
  Example('dio.advanced2', c.advanced2),
  Example('dio.advanced3', c.advanced3),
  Example('dio.advanced4', c.advanced4),
];

Future<void> main(List<String> args) async {
  if (args.isNotEmpty) {
    if (args[0] == 'list') {
      for (var i = 0; i < examples.length; i++) {
        print('${i.toString().padLeft(2, '0')} - ${examples[i].name}');
      }
    } else {
      final number = int.tryParse(args[0])?.clamp(0, examples.length);
      if (number == null) {
        final searchStr = args[0].toLowerCase();
        final found = examples.where((e) => e.searchBy.startsWith(searchStr));
        if (found.isEmpty) {
          print('No examples found');
        } else {
          await runAll(found);
        }
      } else if (number < examples.length) {
        await examples[number].run();
      } else {
        print('No examples found');
      }
    }
  } else {
    await runAll(examples);
  }
}

Future<void> runAll(Iterable<Example> toRun) async {
  for (final e in toRun) {
    await e.run();
  }
}
