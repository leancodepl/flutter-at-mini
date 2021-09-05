// Loops
void main() {
  forLoop();
  forLoop2();
}

void forLoop() {
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }

  print(message);
}

void forLoop2() {
  const candidates = ["Bob", "Zoe"];
  for (final candidate in candidates) {
    print(candidate);
  }
}

void whileLoop() {
  var a = 0;

  while (a < 5) {
    a++;
    print(a);
  }
}

void doWhileLoop() {
  var a = 0;

  do {
    a++;
    print(a);
  } while (a < 5);
}

void breakContinue() {
  var a = 0;

  while (true) {
    a++;
    if (a == 1) continue;
    if (a == 5) break;
    print(a);
  }
}
