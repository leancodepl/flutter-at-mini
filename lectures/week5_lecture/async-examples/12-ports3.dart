import "dart:isolate";

void cpuIntensiveWork(int delay) {
    final sw = Stopwatch()..start();
    while (sw.elapsedMilliseconds < delay);
}

class WorkDescr<TIn> {
    const WorkDescr(this.input, this.resultPort);
    final TIn input;
    final SendPort resultPort;
}

void isolateEntry(WorkDescr<int> input) {
    cpuIntensiveWork(5000);
    input.resultPort.send(input.input + 10);
}

Future main() async {
    final recPort = new ReceivePort();
    await Isolate.spawn(isolateEntry, WorkDescr<int>(100, recPort.sendPort));
    print("Result: ${await recPort.first}");
}
