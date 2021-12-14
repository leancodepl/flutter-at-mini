import "package:test/test.dart";
import 'package:week10_lecture/user_repository.dart';


void main() {
  group('User Repository', () {
    test('validation is correct for corrupted data', () {
      final UserRepository repository = UserRepository();

      expect(repository.hasValidData(User("a")), false);
    });

    test('validation is correct for data', () {
      final UserRepository repository = UserRepository();

      expect(repository.hasValidData(User("a@a.com")), true);
    });

  });
}

