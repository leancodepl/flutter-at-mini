import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week7_lab/data/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authService})
      : super(
          authService.isSignedIn
              ? const SignedInState()
              : const SignedOutState(),
        ) {
    _sub = authService.isSignedInStream.listen((isSignedIn) {
      emit(isSignedIn ? const SignedInState() : const SignedOutState());
    });
  }

  final AuthService authService;
  StreamSubscription<bool>? _sub;

  Future<void> signInWithEmail(
    String email,
    String password,
  ) async {
    emit(const SigningInState());
    await Future<void>.delayed(const Duration(seconds: 1));

    try {
      final res = await authService.signInWithEmail(email, password);

      switch (res) {
        case SignInResult.success:
          emit(const SignedInState());
        case SignInResult.emailAlreadyInUse:
          emit(
            const SignedOutState(
              error: 'This email address is already in use.',
            ),
          );
        case SignInResult.invalidEmail:
          emit(const SignedOutState(error: 'This email address is invalid.'));
        case SignInResult.userDisabled:
          emit(const SignedOutState(error: 'This user has been banned.'));
        case SignInResult.userNotFound:
          emit(
            const SignedOutState(
              error: "This user doesn't exist.",
            ),
          );
        case SignInResult.wrongPassword:
          emit(const SignedOutState(error: 'Invalid credentials.'));
      }
    } catch (_) {
      emit(const SignedOutState(error: 'Unexpected error.'));
    }
  }

  Future<void> signOut() async {
    await authService.signOut();

    emit(const SignedOutState());
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }
}

abstract class AuthState {
  const AuthState();
}

class SignedInState extends AuthState {
  const SignedInState();
}

class SigningInState extends AuthState {
  const SigningInState();
}

class SignedOutState extends AuthState {
  const SignedOutState({
    this.error,
  });

  final String? error;
}
