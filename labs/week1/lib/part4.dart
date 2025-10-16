void part4() {
  print('\n=== Part 4: Generics ===');

  const containers = [
    Container<int>(1),
    Container<String>('Hello'),
    Container<double>(3.14),
    Container<bool>(true),
    // the line below doesn't compile
    // Container<int?>(null),
  ];

  for (final container in containers) {
    switch (container) {
      case Container<num>(:final value):
        print('Got a number – the square is ${value * value}');
      case Container<String>(:final value):
        print('Got a string – the length is ${value.length}');
    }
  }
}

class Container<T extends Object> {
  const Container(this.value);

  final T value;
}
