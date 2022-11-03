import "dart:io";
import "dart:convert";

Future main() async {
    var lines = File("sample.txt")
        .openRead()
        .transform(Utf8Decoder())
        .transform(new LineSplitter());
    await for (var l in lines) {
        print("Line: ${l}");
    }
    print("Done");
}
