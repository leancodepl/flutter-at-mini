import "dart:isolate";

typedef ComputeCallback<Q, R> = R Function(Q message);

class Payload<Q, R> {
    const Payload(this.callback, this.input, this.resultPort);
    final ComputeCallback<Q, R> callback;
    final Q input;
    final SendPort resultPort;
    R apply() => callback(input);
}

void _spawn<Q, R>(Payload<Q, R> payload) => payload.resultPort.send(payload.apply());

Future<R> compute<Q, R>(ComputeCallback<Q, R> callback, Q input) async {
    final resultPort = new ReceivePort();
    final payload = new Payload<Q, R>(callback, input, resultPort.sendPort);
    var isolate = await Isolate.spawn(_spawn, payload);
    var res = await resultPort.first;
    resultPort.close();
    isolate.kill();
    return res;
}

void cpuIntensiveWork(int i) {
    print('Start $i');
    final sw = Stopwatch()..start();
    while (sw.elapsedMilliseconds < i * 100);
    print('Done $i');
}

Future main() async {
    final c = compute<int, void>(cpuIntensiveWork, 3);
    final b = compute<int, void>(cpuIntensiveWork, 2);
    final a = compute<int, void>(cpuIntensiveWork, 1);
    await a;
    await b;
    await c;
}
