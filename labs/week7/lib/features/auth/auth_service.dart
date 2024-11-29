import 'package:firebase_auth/firebase_auth.dart';

enum SignInResult {
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  success,
}

class AuthService {
  AuthService(/* TODO: depend on FirebaseAuth */);

  // TODO: implement using auth
  bool get isSignedIn => false;

  // TODO: implement using auth
  Stream<bool> get isSignedInStream => const Stream.empty();

  // TODO: implement using auth
  String get userEmail => throw UnimplementedError();

  // TODO: implement using auth
  User? get currentUser => throw UnimplementedError();

  Future<SignInResult> signInWithEmail(String email, String password) async {
    try {
      // TODO: implement using auth
      throw UnimplementedError();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return SignInResult.invalidEmail;
        case 'user-disabled':
          return SignInResult.userDisabled;
        case 'user-not-found' || 'invalid-credential':
          return SignInResult.userNotFound;
        case 'wrong-password':
          return SignInResult.wrongPassword;
        default:
          rethrow;
      }
    }
  }

  Future<bool> signUpWithEmail(String email, String password) async {
    try {
      // TODO: implement using auth
      throw UnimplementedError();
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<void> signOut() {
    // TODO: implement using auth
    throw UnimplementedError();
  }
}
