void main() {
  dynamic foo = 'abc';
  print(foo.isEmpty);

  // `dynamic` disables all type system guarantees – this will compile and fail at runtime:
  print(foo.isEven);
}
