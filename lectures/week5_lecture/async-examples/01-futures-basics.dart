Future<void> myFunc() async {
    print("\tBefore delay");
    await Future.delayed(Duration(milliseconds: 500));
    print("\tAfter delay");
}

Future<void> main() async {
    print("Before call");
    var prom = myFunc();
    print("After call");
    await prom;
    print("After await");
}
