import 'package:meta/meta_meta.dart';

@Target({TargetKind.function, TargetKind.method})
class _Inline {
  const _Inline();
}

const inline = _Inline();

@inline // ok
int half(
  @inline int n, // not ok, does not make sense
) {
  return n ~/ 2;
}
