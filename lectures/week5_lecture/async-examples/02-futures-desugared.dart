import 'dart:io';

Future main() {
    var file = File("sample.txt");
    return file.readAsString()
        .then((content) => print("File: ${content}"))
        .catchError((e) => print("ERROR: ${e}"))
        .whenComplete(() => print("All done"));
}
