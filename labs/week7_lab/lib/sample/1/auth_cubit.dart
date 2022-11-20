import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week7_lab/data/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authService})
      : super(
          authService.isSignedIn
              ? const SignedInState()
              : const SignedOutState(),
        );

  final AuthService authService;

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
          break;
        case SignInResult.emailAlreadyInUse:
          emit(
            const SignedOutState(
              error: 'This email address is already in use.',
            ),
          );
          break;
        case SignInResult.invalidEmail:
          emit(const SignedOutState(error: 'This email address is invalid.'));
          break;
        case SignInResult.userDisabled:
          emit(const SignedOutState(error: 'This user has been banned.'));
          break;
        case SignInResult.userNotFound:
          emit(
            const SignedOutState(
              error: "This user doesn't exist.",
            ),
          );
          break;
        case SignInResult.wrongPassword:
          emit(const SignedOutState(error: 'Invalid credentials.'));
          break;
      }
    } catch (_) {
      emit(const SignedOutState(error: 'Unexpected error.'));
    }
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
