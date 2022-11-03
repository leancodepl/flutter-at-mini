import "dart:isolate";

void cpuIntensiveWork(int delay) {
    final sw = Stopwatch()..start();
    while (sw.elapsedMilliseconds < delay);
}

void doWork(List args) {
    cpuIntensiveWork(5000);
    args[0].send(args[1] + 10);
}

Future main() async {
    final recPort = new ReceivePort();
    await Isolate.spawn(doWork, [recPort.sendPort, 100]);
    print('Result: ${await recPort.first}');
}
