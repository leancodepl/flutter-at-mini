import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:week7_lab/data/auth_service.dart';
import 'package:week7_lab/sample/3/auth_cubit.dart';

import 'auth_cubit_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  group('AuthCubit', () {
    late MockAuthService authService;

    setUp(() {
      authService = MockAuthService();
      when(authService.isSignedInStream)
          .thenAnswer((_) => Stream.fromIterable([]));
    });

    test('initial state is SignedInState when authService is signed in', () {
      when(authService.isSignedIn).thenReturn(true);
      final cubit = AuthCubit(authService: authService);
      expect(cubit.state, const SignedInState());
    });

    test('initial state is SignedOutState when authService is signed out', () {
      when(authService.isSignedIn).thenReturn(false);
      final cubit = AuthCubit(authService: authService);
      expect(cubit.state, const SignedOutState());
    });

    blocTest<AuthCubit, AuthState>(
      'signInWithEmail emits signed in state on correct sign in',
      build: () {
        when(authService.isSignedIn).thenReturn(false);
        when(authService.signInWithEmail(any, any))
            .thenAnswer((_) async => SignInResult.success);
        return AuthCubit(authService: authService);
      },
      act: (c) => c.signInWithEmail('email', 'password'),
      expect: () => [
        const SigningInState(),
        const SignedInState(),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'signInWithEmail emits signed out state with error when password is wrong',
      build: () {
        when(authService.isSignedIn).thenReturn(false);
        when(authService.signInWithEmail(any, any))
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
