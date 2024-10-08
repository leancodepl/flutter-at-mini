// ignore_for_file: unused_field, unused_local_variable

class A {
  A();
  A.some();
  A.someOther(this.number);
  A.anotherOne(this.number, {this.text});

  var number;
  String? text = 'text';
}

class B {
  B(this._firstName, this.lastName);

  B.sample()
      : _firstName = 'John',
        lastName = 'Smith';

  factory B.create(String fullName) {
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
