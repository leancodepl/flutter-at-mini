void foo(dynamic obj) {
  const firstPattern = 'abc';
  const secondPattern = 'def';

  // A switch statement with pattern matching
  switch (obj) {
    case 1:
      print('number one');
    case String s:
      print(s.length);
    case [firstPattern, secondPattern, var thirdParam, ...var rest]:
      print('this is it with $thirdParam and the $rest');
    case [firstPattern, secondPattern, ...var rest]:
      print('this is it and the $rest');
    case [[firstPattern, ...var _], secondPattern, ...var _]:
      print('this is weird');
  }

  // A switch expression with pattern matching – always has to be exhaustive
  print(switch (obj) {
    1 => 'number one',
    [firstPattern, secondPattern, var thirdParam, ...var rest] =>
      'this is it with $thirdParam and the $rest',
    [firstPattern, secondPattern, ...var rest] => 'this is it and the $rest',
    [[firstPattern, ...var _], secondPattern, ...var _] => 'this is weird',
    String s => s.length,
    List(:var length) when length > 4 => 'a long list of length $length',
    _ => 'default',
  });
}

void main() {
  foo(1);
  foo('flutter');
  foo(1.3);
  foo(['abc', 'def', 123, 456]);
  foo(['abc', 'def']);
  foo([
    ['abc', 'anything'],
    'def',
    42,
  ]);
  foo([true, null, 1, 'hello', Object()]);
}
