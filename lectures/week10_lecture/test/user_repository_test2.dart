import 'package:mocktail/mocktail.dart';
import "package:test/test.dart";
import 'package:week10_lecture/user_repository.dart';
import 'package:week10_lecture/user_repository2.dart';

class EmailValidatorMock extends Mock implements EmailValidator {}

class UserFake extends Fake implements User {}

void main() {
  group('User Repository', () {
    late EmailValidatorMock emailValidatorMock;
    late UserRepository2 repository;

    // setUpAll(() {
    //   registerFallbackValue(UserFake());
    // });

    setUp(() {
      emailValidatorMock = EmailValidatorMock();
      repository = UserRepository2(emailValidatorMock);
    });

    tearDown(() {});

    test('validation is correct for corrupted data', () {
      when(() => emailValidatorMock.isValid("a")).thenReturn(false);

      repository.hasValidData(User("a"));

      verify(() => emailValidatorMock.isValid("a")).called(1);
    });

    test('validation is correct for data', () {
      when(() => emailValidatorMock.isValid("a@a.com")).thenReturn(false);

      repository.hasValidData(User("a@a.com"));

      verify(() => emailValidatorMock.isValid("a@a.com")).called(1);
    });

    test('capture sample', () {
      when(() => emailValidatorMock.isValid("a@a.com")).thenReturn(true);
      expect(emailValidatorMock.isValid("a@a.com"), isTrue);

      final captured =
          verify(() => emailValidatorMock.isValid(captureAny())).captured;
      expect(captured.last, equals("a@a.com"));
    });

    // test('fallback ', () {
    //   when(() => repository.hasValidData(any()));
    // });

    // :(
    test('throw example', () {
      when(() => emailValidatorMock.isValid(any()))
          .thenThrow(Exception('oops'));

      expect(() => emailValidatorMock.isValid("a"), throwsA(isA<Exception>()));
    });

    test(
        'Given valid email When validating user data Should call email validator',
        () {
      //given
      when(() => emailValidatorMock.isValid("a@a.com")).thenReturn(false);

      //when
      repository.hasValidData(User("a@a.com"));

      //then
      verify(() => emailValidatorMock.isValid("a@a.com")).called(1);
    });
  });
}
