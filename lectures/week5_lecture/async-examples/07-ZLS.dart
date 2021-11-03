void myWork(String otherData) {
    print(otherData);
}

void processArg(String arg) {
    uncontrolled("Data gen");
}

void uncontrolled(String otherData) => myWork(otherData);

void main() => ['A', 'B'].forEach(processArg);
