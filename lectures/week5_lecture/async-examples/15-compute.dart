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

int bumpBy10(int v) => v + 10;

Future main() async {
    final result = await compute(bumpBy10, 100);

    print("Result: ${result}");
}
