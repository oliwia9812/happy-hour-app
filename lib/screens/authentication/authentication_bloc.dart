import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_hour_app/models/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth;

  AuthenticationBloc(this._firebaseAuth)
      : super(AuthenticationUnInitialized()) {
    on<AppStarted>(_onAppStarted);
    on<SignOut>(_onSignOut);
    on<SignInWithEmailAndPassword>(_onSignInWithEmailAndPassword);
    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);
  }

  Future<void> _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    final currentUser = _firebaseAuth.currentUser;

    await Future.delayed(const Duration(seconds: 2));

    if (currentUser != null) {
      emit(AuthenticationAuthenticated(displayName: currentUser.displayName));
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _onSignUpWithEmailAndPassword(SignUpWithEmailAndPassword event,
      Emitter<AuthenticationState> emit) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(
          email: event.userModel.email,
          password: event.userModel.password,
        )
        .then(
          (value) => value.user?.updateDisplayName(event.userModel.name),
        );
    emit(
      AuthenticationAuthenticated(
          displayName: _firebaseAuth.currentUser!.displayName),
    );
  }

  Future<void> _onSignInWithEmailAndPassword(SignInWithEmailAndPassword event,
      Emitter<AuthenticationState> emit) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: event.userModel.email,
      password: event.userModel.password,
    );
    emit(
      AuthenticationAuthenticated(
          displayName: _firebaseAuth.currentUser!.displayName),
    );
  }

  Future<void> _onSignOut(
      SignOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await _firebaseAuth.signOut();
    emit(AuthenticationUnauthenticated());
  }
}
