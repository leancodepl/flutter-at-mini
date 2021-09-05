// Async
void main() async {
  await sample();
  sample2();

  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // 55
}

Future<void> sample() async {
  print(1);
  await Future.delayed(const Duration(seconds: 2), () {
    print(2);
  });

  print(3);
}

void sample2() {
  print(4);
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}
