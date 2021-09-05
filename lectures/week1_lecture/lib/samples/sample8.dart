// Classes
void main() {
  final optionalPoint = Point.optional();
  print("${optionalPoint.x} ${optionalPoint.y}");
  final optionalX = Point.optionalX(y: 2);
  print("${optionalX.x} ${optionalX.y}");

  final point3D = Point3D.optionalX(y: 5);
  print("${point3D.x} ${point3D.y} ${point3D.z}");

  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));
}

class Point {
  int x = 0;
  int y = 0;

  String get position => "x: $x y: $y";

  set newX(int value) => x = value;

  Point.zero()
      : x = 0,
        y = 0;

  Point.optional({this.x = 0, this.y = 0});

  Point.optionalX({this.x = 0, required this.y});
}

class Point3D extends Point {
  int z = 0;

  Point3D.optional() : super.optional();

  Point3D.optionalX({int x = 0, required int y, this.z = 0})
      : super.optionalX(y: y, x: x);
}

class Person {
  // In the interface, but visible only in this library.
  final String _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
  @override
  String get _name => '';

  @override
  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');
