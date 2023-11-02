import "dart:async";

void func() => print("In Func");

void main() {
    runZoned(() async {
        func();
        await new Future(() => print("In Future"));
        print("After future");
    }, zoneSpecification: ZoneSpecification(
        print: (self, parent, zone, s) => parent.print(zone, "Zoned: ${s}"),
        run: <R>(self, parent, zone, f) {
            parent.print(zone, "Zone call: ${f}");
            return parent.run(zone, f);
        }));
}
