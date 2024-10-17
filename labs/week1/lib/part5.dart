import 'dart:math';

void part5() {
  print('\n=== Part 5: Records ===');

  final triple = generate();
  final result = transform(triple);
  print('Generated: $triple');
  print('Transformed: $result');

  final (:x, :y, :enabled, :temperature) = randomize();
  print('Randomized: x=$x, y=$y, enabled=$enabled, temperature=$temperature');
}

final random = Random();

(int, int, int) generate() => (
      random.nextInt(20),
      random.nextInt(20),
      random.nextInt(20),
    );

Object transform((int, int, int) triple) => switch (triple) {
      (0, 0, 0) => 'All zeros!',
      (> 10, 5, final c) => c,
      (final a, final b, final c) when a.isEven => (b, c),
// or, to check without the `when` clause:
      (int(isEven: true), final b, final c) => (b, c),
      final triple => triple,
    };

({int x, int y, bool enabled, double temperature}) randomize() => (
      x: random.nextInt(100),
      y: random.nextInt(100),
      enabled: random.nextBool(),
      temperature: random.nextDouble() * 100,
    );
