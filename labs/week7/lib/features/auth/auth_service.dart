import 'package:firebase_auth/firebase_auth.dart';

enum SignInResult() {
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  success,
}

class AuthService(/* TODO: depend on FirebaseAuth */) {
  bool get isSignedIn => false;

  // TODO: implement using auth
  Stream<bool> get isSignedInStream => const .empty();

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
          return .invalidEmail;
        case 'user-disabled':
          return .userDisabled;
        case 'user-not-found' || 'invalid-credential':
          return .userNotFound;
        case 'wrong-password':
          return .wrongPassword;
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
