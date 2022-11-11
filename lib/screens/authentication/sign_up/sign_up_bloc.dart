import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/models/user.dart';
import 'package:happy_hour_app/screens/authentication/authentication_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthenticationBloc authBloc;

  SignUpBloc({required this.authBloc}) : super(SignUpInitial()) {
    on<SignUpWithEmailAndPasswordButtonPressed>(
        _onSignUpWithEmailAndPasswordButtonPressed);
  }

  Future<void> _onSignUpWithEmailAndPasswordButtonPressed(
    SignUpWithEmailAndPasswordButtonPressed event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpWithEmailAndPasswordFailedLoading());
    try {
      authBloc.add(SignUpWithEmailAndPassword(userModel: event.user));
      emit(SignUpInitial());
    } on FirebaseAuthException catch (e) {
      emit(
        SignUpWithEmailAndPasswordFailedFailure(
          error: e.message.toString(),
        ),
      );
    }
  }
}
