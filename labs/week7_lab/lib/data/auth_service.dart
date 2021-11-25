import 'package:firebase_auth/firebase_auth.dart';

enum SignInResult {
  invalidEmail,
  userDisabled,
  userNotFound,
  emailAlreadyInUse,
  wrongPassword,
  success,
}

class AuthService {
  const AuthService({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  bool get isSignedIn => firebaseAuth.currentUser != null;
  Stream<bool> get isSignedInStream =>
      firebaseAuth.userChanges().map((user) => user != null);

  Future<SignInResult> signInWithEmail(
    String email,
    String password,
  ) async {
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
      if (e.code == 'invalid-email') {
        return SignInResult.invalidEmail;
      } else if (e.code == 'email-already-in-use') {
        return SignInResult.emailAlreadyInUse;
      } else if (e.code == 'user-disabled') {
        return SignInResult.userDisabled;
      } else if (e.code == 'user-not-found') {
        return SignInResult.userNotFound;
      } else if (e.code == 'wrong-password') {
        return SignInResult.wrongPassword;
      } else {
        print(e);
        rethrow;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> signUpWithEmail(
    String email,
    String password,
  ) async {
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
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> signOut() => firebaseAuth.signOut();
}
