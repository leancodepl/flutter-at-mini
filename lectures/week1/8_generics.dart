// ignore_for_file: unnecessary_type_check

abstract class Cache<K extends String, T> {
  T get(K key);
  void set(K key, T value);
}

void main() {
  // generics are reified!
  final list = <String>['foo', 'bar'];
  list.add('abc');

  print(list is List<String>);
}
