main() {
  print('=== Records ===');
  print('');

  // Records can have all positional fields
  final (double?, String, bool, List<int>) positionalRecord;
  positionalRecord = (null, 'hello', true, [1, 2, 3]);

  // Accessing positional fields via $n (one-based)
  print('The entire record: $positionalRecord');
  print('Second field: ${positionalRecord.$2}');
  print('');

  // Records can have all named fields
  final ({double? a, String b, bool c, List<int> d}) namedRecord;
  namedRecord = (a: null, b: 'hello', c: true, d: [1, 2, 3]);

  // Accessing named fields via field name
  print('The entire record: $namedRecord');
  print('field `b`: ${namedRecord.b}');
  print('');

  // Records can have a mix of positional and named fields
  final (double?, List<int>, {String b, bool c}) mixedRecord;
  mixedRecord = (null, [1, 2, 3], b: 'hello', c: true);

  // Accessing positional fields via $n (one-based)
  // Accessing named fields via field name
  print('The entire record: $mixedRecord');
  print('First positional field: ${mixedRecord.$1}');
  print('field `b`: ${mixedRecord.b}');
  print('');
}
