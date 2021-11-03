import "dart:async";

void main() {
    var fut = Future.value(100);
    var res = runZoned(() {
        return fut.then((_) => throw "inside zone");
    }, onError: (e, s) => print("Zoned: ${e}"));
    res.then(print)
        .catchError((e) => print("Outside: ${e}"));
}
