import 'dart:io';

void part1() {
  print('\n=== Part 1: Hello, Dart! ===');

  greeting();

  triangle1();
  triangle2();
  triangle3();
}

void greeting() {
  print("What's your name?");
  final name = stdin.readLineSync();

  print("What's your favorite color?");
  final color = stdin.readLineSync();

  print('Hello, $name! Your favorite color is $color.');
}

const count = 7;

void triangle1() {
  for (var i = 0; i < count; i++) {
    for (var j = 0; j <= i; j++) {
      stdout.write('*');
    }
    stdout.writeln();
  }
}

void triangle2() {
  for (var i = 1; i <= count; i++) {
    print('*' * i);
  }
}

void triangle3() {
  print(Iterable.generate(count, (i) => '*' * (i + 1)).join('\n'));
}
