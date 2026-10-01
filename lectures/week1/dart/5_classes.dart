class A {
  new();
  new some();
  new someOther(this.number);
  new anotherOne(this.number, {this.text});

  int? number;
  String? text = 'text';
}

class B {
  new(this._firstName, this.lastName);

  new sample() : _firstName = 'John', lastName = 'Smith';

  factory create(String fullName) {
    final firstName = fullName.split(' ').first;
    final lastName = fullName.split(' ').last;

    return B(firstName, lastName);
  }

  final String _firstName;
  final String lastName;
}

void main() {
  // constructor tear-off
  const op = A.someOther;
  final aInstance = op(5);
}
