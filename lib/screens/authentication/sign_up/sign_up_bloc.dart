import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:happy_hour_app/models/user.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _firebaseAuth;

  SignUpBloc(this._firebaseAuth) : super(SignUpInitial()) {
    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);
  }

  Future<void> _onSignUpWithEmailAndPassword(
      SignUpWithEmailAndPassword event, Emitter<SignUpState> emit) async {
    final String email = event.user.email;
    final String password = event.user.password;

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(SignUpWithEmailAndPasswordSuccess());
    } catch (e) {
      print(e);
    }
  }
}
