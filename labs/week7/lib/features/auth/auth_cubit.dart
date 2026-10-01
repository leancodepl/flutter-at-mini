import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labs_week7/features/auth/auth_service.dart';

class AuthCubit({required final AuthService authService})
    extends Cubit<AuthState> {
  this : super(authService.stateFromAuth) {
    _sub = authService.isSignedInStream.listen((isSignedIn) {
      emit(authService.stateFromAuth);
    });
  }

  StreamSubscription<bool>? _sub;

  Future<void> signInWithEmail(String email, String password) async {
    emit(AuthStateSigningIn());
    await Future<void>.delayed(const Duration(seconds: 1));

    try {
      final result = await authService.signInWithEmail(email, password);

      switch (result) {
        case SignInResult.invalidEmail:
          emit(AuthStateSignedOut(error: 'This email address is invalid.'));
        case SignInResult.userDisabled:
          emit(AuthStateSignedOut(error: 'This user has been banned.'));
        case SignInResult.userNotFound:
          await _trySignUp(email, password);
        case SignInResult.wrongPassword:
          emit(AuthStateSignedOut(error: 'Invalid credentials.'));
        case SignInResult.success:
          emit(AuthStateSignedIn(email: email));
      }
    } catch (err) {
      emit(AuthStateSignedOut(error: 'Unexpected error: $err'));
    }
  }

  Future<void> signOut() async {
    await authService.signOut();

    emit(AuthStateSignedOut());
  }

  Future<void> _trySignUp(String email, String password) =>
      authService.signUpWithEmail(email, password);

  @override
  Future<void> close() async {
    await _sub?.cancel();
    await super.close();
  }
}

extension on AuthService {
  AuthState get stateFromAuth =>
      isSignedIn ? AuthStateSignedIn(email: userEmail) : AuthStateSignedOut();
}

sealed class AuthState() with Equatable;

class AuthStateSignedIn({required final String email}) extends AuthState {
  @override
  List<Object?> get props => [email];
}

class AuthStateSigningIn() extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthStateSignedOut({final String? error}) extends AuthState {
  @override
  List<Object?> get props => [error];
}
