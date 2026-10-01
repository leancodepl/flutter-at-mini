class Person._() {
  factory sample() => Person._()
    ..firstName = 'John'
    ..lastName = 'Smith'
    ..age = 35;

  String? firstName;
  String? lastName;
  int? age;

  List<dynamic> listify() => []
    ..add(firstName)
    ..add(lastName)
    ..add(age);
}

List<int> withoutLast(Iterable<int> list) => list.toList()..removeLast();
