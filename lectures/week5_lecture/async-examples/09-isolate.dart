import "dart:isolate";

int value = 0;

void cpuIntensiveWork(int delay) {
    final sw = Stopwatch()..start();
    while (sw.elapsedMilliseconds < delay * 500);
}

void entryPoint(int msg) {
    print("[${msg}] Running in ${Isolate.current.hashCode}");
    while (value < 5) {
        print("[${msg}]: ${value++}");
        cpuIntensiveWork(msg);
    }
}

void main() {
    [1, 2].forEach((i) => Isolate.spawn(entryPoint, i));
    entryPoint(3);
}
