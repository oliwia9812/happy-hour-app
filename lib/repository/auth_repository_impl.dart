import 'package:happy_hour_app/models/user.dart';
import 'package:happy_hour_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<void>? signUp({required UserModel user}) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          )
          .then(
            (value) => value.user?.updateDisplayName(user.name),
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
  Future<void>? signIn({required UserModel user}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw "No user found for that email";
      } else if (e.code == "wrong-password") {
        throw "Wrong password provided for that user";
      }
    }
  }

  @override
  Future<void>? signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void>? resetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw "No user found for that email";
    }
  }
}
