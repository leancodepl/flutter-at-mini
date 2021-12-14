import 'dart:async';

class UserRepository {

  final _emailValidator = EmailValidator();

  bool hasValidData(User user) {
    return _emailValidator.isValid(user.email);
  }

}

class EmailValidator {

  final _regex = RegExp(r'\w+@\w+\.\w+');

  bool isValid(String email) {
    return _regex.hasMatch(email);
  }

  Stream<String> observeEmail() {
    return Stream.value("a@a.com");
  }
}

class User {
  String email;

  User(this.email);
}


