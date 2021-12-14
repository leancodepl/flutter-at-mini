import 'dart:async';

import 'package:week10_lecture/user_repository.dart';

class UserRepository3 {

  UserRepository3(this._emailValidator, this._userStream) {
    _subscription = _userStream.listen((event) {
      hasValidData(event);
    });
  }

  late StreamSubscription _subscription;

  final EmailValidator _emailValidator;
  final Stream<User> _userStream;

  bool hasValidData(User user) {
    return _emailValidator.isValid(user.email);
  }

  void cancel() {
    _subscription.cancel();
  }
}


