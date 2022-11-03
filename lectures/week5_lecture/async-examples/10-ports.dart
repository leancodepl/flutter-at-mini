import "dart:isolate";

void isolateEntry(SendPort controlPort) async {
    final dataPort = new ReceivePort();
    controlPort.send(dataPort.sendPort);
    controlPort.send((await dataPort.first) + 10);
    dataPort.close();
}

Future main() async {
    final controlPort = new ReceivePort();
    final bStream = controlPort.asBroadcastStream();
    await Isolate.spawn(isolateEntry, controlPort.sendPort);
    var dataPort = await bStream.first as SendPort;
    dataPort.send(100);
    print("Result: ${await bStream.first}");
    controlPort.close();
}
