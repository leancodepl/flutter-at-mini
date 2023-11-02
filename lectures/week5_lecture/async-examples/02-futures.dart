import 'dart:io';

Future main() async {
    try {
        var file = File("sample.txt");
        var content = await file.readAsString();
        print("File: ${content}");
    } catch (e) {
        print("ERROR: ${e}");
    } finally {
        print("All done");
    }
}
