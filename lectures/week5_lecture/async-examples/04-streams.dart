Stream<int> gen() async* {
    yield 1;
    await Future.delayed(Duration(seconds: 1));
    yield 2;
}

Future main() async {
    await for (var i in gen()) {
        print("Data: ${i}");
    }
    print("After");
}
