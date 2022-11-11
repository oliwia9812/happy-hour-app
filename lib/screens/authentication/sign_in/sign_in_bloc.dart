import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_hour_app/models/user.dart';
import 'package:happy_hour_app/screens/authentication/authentication_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationBloc authBloc;

  SignInBloc({required this.authBloc}) : super(SignInInitial()) {
    on<SignInButtonPressed>(_onSignInButtonPressed);
  }

  Future<void> _onSignInButtonPressed(
      SignInButtonPressed event, Emitter<SignInState> emitter) async {
    emit(SignInLoading());

    try {
      authBloc.add(SignInWithEmailAndPassword(userModel: event.userModel));
      emit(SignInInitial());
    } on FirebaseAuthException catch (e) {
      emit(
        SignInFailure(
          error: e.message.toString(),
        ),
      );
    }
  }
}
