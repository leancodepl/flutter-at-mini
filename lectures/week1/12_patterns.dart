void foo(dynamic obj) {
  const firstPattern = 'abc';
  const secondPattern = 'def';

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
}

void main() {
  foo(1);
  foo('flutter');
  foo(1.3);
  foo(['abc', 'def', 123, 456]);
  foo(['abc', 'def']);
  foo(
    [
      ['abc', 'anything'],
      'def',
      42,
    ],
  );
}
