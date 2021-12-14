import 'package:week10_lecture/user_repository.dart';

class UserRepository2 {

  UserRepository2(this._emailValidator);

  final EmailValidator _emailValidator;

  bool hasValidData(User user) {
    return _emailValidator.isValid(user.email);
  }

}


