import "dart:async";

Stream<int> gen() {
    var ctrl = StreamController<int>();
    new Future(() => ctrl.add(1))
        .then((_) => Future.delayed(Duration(seconds: 1)))
        .then((_) { ctrl.add(2); ctrl.close(); });
    return ctrl.stream;
}

Future main() {
    var c = Completer();
    gen().listen(
        (i) => print("Data: ${i}"),
        onDone: () => c.complete());
    return c.future.then((_) => print("After"));
}
