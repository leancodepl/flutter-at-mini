import 'package:freezed_annotation/freezed_annotation.dart';

@useResult // pure function, callers should collect result
String repeat(String s, int n) {
  final builder = StringBuffer();

  for (var i = 0; i < n; i++) {
    builder.write(s);
  }

  return builder.toString();
}

void func() {
  // not ok, result is never used, this is a no-op
  repeat('Merry Christmas', 10);
}
