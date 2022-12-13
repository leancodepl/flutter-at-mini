import 'package:flutter_test/flutter_test.dart';
import 'package:testing/counter.dart';

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      final counter = Counter();

      expect(counter.value, 0);
    });

    test('Counter value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('Counter value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
