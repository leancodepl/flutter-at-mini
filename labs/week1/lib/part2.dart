import 'dart:math';

import 'package:collection/collection.dart';

void part2() {
  print('\n=== Part 2: Collections & loops ===');

  final ints = List.generate(30, (_) => Random().nextInt(21));
  print(ints);

  final sorted = ints.sorted((a, b) => b.compareTo(a));
  print(sorted);

  final filtered = sorted.where((element) => element % 3 == 0);
  print(filtered);

  final unique = filtered.toSet();
  print(unique);

  for (final (index, value) in unique.indexed) {
    print('$index\t$value\tis even: ${value.isEven}');
  }

  final strings = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
  ];
  print(strings);

  final withLengths = {
    for (final string in strings) string: string.length,
  };
  print(withLengths);

  final grouped1 = strings.groupListsBy((e) => e[0]);
  print(grouped1);

  final grouped2 = groupBy(strings, (e) => e[0]);
  print(grouped2);
}
