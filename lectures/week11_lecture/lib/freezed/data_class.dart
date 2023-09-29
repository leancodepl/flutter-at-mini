import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_class.freezed.dart';

// freezed classes are "sealed": you shouldn't extend them
@freezed
class User with _$User {
  // Freezed will read all constructor parameters and turn them into fields of `User`
  // assertions need a special annotation
  @Assert('age >= 18')
  const factory User({
    required String name,
    required String? email,
    required int age,
    // default value needs a special annotation
    @Default(false) bool isAdmin,
    required Map<String, String> attributes,
  }) = _User;
}

void main() {
  // can be const constructed
  const user = User(
    name: 'Marcin',
    email: 'marcin.wojnarowski@leancode.pl',
    age: 23,
    isAdmin: false,
    attributes: {'tired': 'always'},
  );

  const user2 = User(
    name: 'Marcin',
    email: 'marcin.wojnarowski@leancode.pl',
    age: 23,
    attributes: {'tired': 'always'},
  );

  // freezed classes have deep value equality
  print('user == user2: ${user == user2}');

  // copyWith creates a new copied object with altered values
  final adminUser = user.copyWith(isAdmin: true);

  print('user == adminUser: ${user == adminUser}');

  // pretty printed toString() implementation
  print('user = $user');

  // copyWith can set nulls
  final userWithoutEmail = user.copyWith(email: null);
  print('userWithoutEmail = $userWithoutEmail');

  // manual implementation of copyWith cannot copy nulls
  final myUserWithoutEmail = user.myCopyWith(email: null);
  print('myUserWithoutEmail = $myUserWithoutEmail');
}

extension on User {
  // naive implementation of copyWith
  // Suffers from several issues:
  //  - You need to remember to pass all fields, otherwise you will lose data when copying
  //  - Impossible to set a field to null. Consider trying to set `name: null`: `name ?? this.name` -> `null ?? this.name` -> `this.name`
  User myCopyWith({
    String? name,
    String? email,
    int? age,
    bool? isAdmin,
    Map<String, String>? attributes,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
        age: age ?? this.age,
        isAdmin: isAdmin ?? this.isAdmin,
        attributes: attributes ?? this.attributes,
      );
}
