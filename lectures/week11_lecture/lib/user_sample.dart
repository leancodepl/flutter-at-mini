import 'package:week11_lecture/code_generation/json_serializable/user.dart';

class UserRepository {

  User fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  Map<String, dynamic> toJson(User user) {
    return user.toJson();
  }
}
