class Person {
  Person._();

  String? firstName;
  String? lastName;
  int? age;

  factory Person.sample() => Person._()
    ..firstName = 'John'
    ..lastName = 'Smith'
    ..age = 35;
}

List withoutLast(Iterable list) => list.toList()..removeLast();
