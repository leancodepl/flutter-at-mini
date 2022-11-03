import "dart:async";

void myWork(String otherData) {
    print("${Zone.current[#arg]} -> ${otherData}");
}

void processArg(String arg) {
    runZoned(() => uncontrolled("Data gen"),
        zoneValues: { #arg: arg });
}

void uncontrolled(String otherData) => myWork(otherData);

void main() => ['A', 'B'].forEach(processArg);
