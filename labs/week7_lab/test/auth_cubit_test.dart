import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:week7_lab/data/auth_service.dart';
import 'package:week7_lab/sample/3/auth_cubit.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  group('AuthCubit', () {
    late MockAuthService authService;

    setUp(() {
      authService = MockAuthService();
      when(() => authService.isSignedInStream)
          .thenAnswer((_) => Stream.fromIterable([]));
    });

    test('initial state is SigningInState when authService is signed in', () {
      when(() => authService.isSignedIn).thenReturn(true);
      when(() => authService.userEmail).thenReturn('email');
      final cubit = AuthCubit(authService: authService);
      expect(
        cubit.state,
        const SigningInState(),
      );
    });

    test('initial state is SigningOutState when authService is signed out', () {
      when(() => authService.isSignedIn).thenReturn(false);
      final cubit = AuthCubit(authService: authService);
      expect(cubit.state, const SigningInState());
    });

    blocTest<AuthCubit, AuthState>(
      'signInWithEmail emits signed in state on correct sign in',
      build: () {
        when(() => authService.isSignedIn).thenReturn(false);
        when(() => authService.signInWithEmail(any(), any()))
            .thenAnswer((_) async => SignInResult.success);
        when(() => authService.userEmail).thenReturn('email');

        return AuthCubit(authService: authService);
      },
      act: (c) => c.signInWithEmail('email', 'password'),
      expect: () => [
        const SigningInState(),
        isA<SignedInState>().having((s) => s.email, 'email', 'email'),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'signInWithEmail emits signed out state with error when password is wrong',
      build: () {
        when(() => authService.isSignedIn).thenReturn(false);
        when(() => authService.signInWithEmail(any(), any()))
            .thenAnswer((_) async => SignInResult.wrongPassword);
        return AuthCubit(authService: authService);
      },
      act: (c) => c.signInWithEmail('email', 'password'),
      expect: () => [
        const SigningInState(),
        const SignedOutState(error: 'Invalid credentials.'),
      ],
    );
  });
}
