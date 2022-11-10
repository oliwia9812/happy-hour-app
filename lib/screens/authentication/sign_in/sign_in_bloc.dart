import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_hour_app/models/user.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final FirebaseAuth _firebaseAuth;
  SignInBloc(this._firebaseAuth) : super(SignInInitial()) {
    on<SignIn>(_onSignIn);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onSignIn(SignIn event, Emitter<SignInState> emitter) async {
    final String email = event.userModel.email;
    final String password = event.userModel.password;

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailed());
    }
  }

  Future<void> _onSignOut(SignOut event, Emitter<SignInState> emitter) async {
    await _firebaseAuth.signOut();
    emit(SignOutSuccess());
  }
}
