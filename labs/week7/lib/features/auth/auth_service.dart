import 'package:firebase_auth/firebase_auth.dart';

enum SignInResult {
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  success,
}

class AuthService {
  const AuthService({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  bool get isSignedIn => currentUser != null;

  Stream<bool> get isSignedInStream =>
      firebaseAuth.userChanges().map((user) => user != null);

  String get userEmail => currentUser!.email!;

  User? get currentUser => firebaseAuth.currentUser;

  Future<SignInResult> signInWithEmail(String email, String password) async {
    try {
      if (isSignedIn) {
        await firebaseAuth.signOut();
      }

      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return SignInResult.success;
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
      if (isSignedIn) {
        await firebaseAuth.signOut();
      }

      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<void> signOut() => firebaseAuth.signOut();
}
