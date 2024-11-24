import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week7/features/auth/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authService}) : super(authService.stateFromAuth) {
    _sub = authService.isSignedInStream.listen((isSignedIn) {
      emit(authService.stateFromAuth);
    });
  }

  final AuthService authService;
  StreamSubscription<bool>? _sub;

  Future<void> signInWithEmail(String email, String password) async {
    emit(SigningInState());
    await Future<void>.delayed(const Duration(seconds: 1));

    try {
      final result = await authService.signInWithEmail(email, password);

      emit(
        switch (result) {
          SignInResult.invalidEmail =>
            SignedOutState(error: 'This email address is invalid.'),
          SignInResult.userDisabled =>
            SignedOutState(error: 'This user has been banned.'),
          SignInResult.userNotFound =>
            SignedOutState(error: "This user doesn't exist."),
          SignInResult.wrongPassword =>
            SignedOutState(error: 'Invalid credentials.'),
          SignInResult.success => SignedInState(email: email),
        },
      );
    } catch (_) {
      emit(SignedOutState(error: 'Unexpected error.'));
    }
  }

  Future<void> signOut() async {
    await authService.signOut();

    emit(SignedOutState());
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }
}

extension on AuthService {
  AuthState get stateFromAuth =>
      isSignedIn ? SignedInState(email: userEmail) : SignedOutState();
}

sealed class AuthState with EquatableMixin {}

class SignedInState extends AuthState {
  SignedInState({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class SigningInState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignedOutState extends AuthState {
  SignedOutState({this.error});

  final String? error;

  @override
  List<Object?> get props => [error];
}
