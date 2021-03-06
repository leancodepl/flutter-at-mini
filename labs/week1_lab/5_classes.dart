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
