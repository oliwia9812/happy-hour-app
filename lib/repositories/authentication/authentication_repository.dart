import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_hour_app/repositories/authentication/base_authentication_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository implements BaseAuthenticationRepository {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => value.user?.updateDisplayName(name),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email';
      } else {
        throw e.code;
      }
    }
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw "No user found for that email";
      } else if (e.code == "wrong-password") {
        throw "Wrong password provided for that user";
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw "No user found for that email";
      }
    }
  }

  User? get currentUser => _firebaseAuth.currentUser;
}
