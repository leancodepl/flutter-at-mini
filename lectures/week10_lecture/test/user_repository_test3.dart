import 'dart:async';

import 'package:mocktail/mocktail.dart';
import "package:test/test.dart";
import 'package:week10_lecture/user_repository.dart';
import 'package:week10_lecture/user_repository3.dart';

class EmailValidatorMock extends Mock implements EmailValidator {}

void main() {
  group('User Repository', () {
    late EmailValidatorMock emailValidatorMock;
    late StreamController<User> streamController =
        StreamController.broadcast(sync: true);
    late UserRepository3 repository;

    setUp(() {
      emailValidatorMock = EmailValidatorMock();
      repository = UserRepository3(emailValidatorMock, streamController.stream);
    });

    tearDown(() {
      repository.cancel();
    });

    test('Test Stream', () {
      when(() => emailValidatorMock.isValid("a@a.com")).thenReturn(false);

      streamController.add(User("a@a.com"));
      streamController.add(User("a@a.com"));
      streamController.add(User("a@a.com"));

      verify(() => emailValidatorMock.isValid("a@a.com")).called(3);
    });

    test('Mock Stream', () {
      when(() => emailValidatorMock.observeEmail())
          .thenAnswer((_) => Stream.fromIterable(["a@a.com"]));
    });
  });
}
