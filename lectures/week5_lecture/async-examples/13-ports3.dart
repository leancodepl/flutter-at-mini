import "dart:isolate";

typedef WorkCallback<TIn, TOut> = TOut Function(TIn message);

class Payload<TIn, TOut> {
    const Payload(this.callback, this.input, this.resultPort);
    final WorkCallback<TIn, TOut> callback;
    final TIn input;
    final SendPort resultPort;
    TOut doWork() => callback(input);
}

void workEntrypoint<TIn, TOut>(Payload<TIn, TOut> work) {
    work.resultPort.send(work.doWork());
}

Future<TOut> doWork<TIn, TOut>(WorkCallback<TIn, TOut> callback, TIn input) async {
    final resultPort = new ReceivePort();
    final descr = new Payload<TIn, TOut>(callback, input, resultPort.sendPort);
    await Isolate.spawn(workEntrypoint, descr);
    return await resultPort.first;
}

void cpuIntensiveWork(int i) {
    print('Start $i');
    final sw = Stopwatch()..start();
    while (sw.elapsedMilliseconds < i * 100);
    print('Done $i');
}

Future main() async {
    final c = doWork<int, void>(cpuIntensiveWork, 3);
    final b = doWork<int, void>(cpuIntensiveWork, 2);
    final a = doWork<int, void>(cpuIntensiveWork, 1);
    await a;
    await b;
    await c;
}
