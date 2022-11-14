import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_hour_app/models/user.dart';
import 'package:happy_hour_app/repository/auth_repository_impl.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth;
  final AuthRepositoryImpl authRepositoryImpl;

  AuthenticationBloc(this._firebaseAuth, this.authRepositoryImpl)
      : super(AuthenticationUninitialized()) {
    on<AppStarted>(_onAppStarted);
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    final User? currentUser = _firebaseAuth.currentUser;

    await Future.delayed(const Duration(seconds: 2));

    if (currentUser != null) {
      emit(AuthenticationAuthenticated(
          displayName: currentUser.displayName ?? ""));
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _onSignUp(
      SignUp event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      await authRepositoryImpl.signUp(user: event.userModel);
      emit(
        AuthenticationAuthenticated(
            displayName: _firebaseAuth.currentUser?.displayName ?? ""),
      );
    } catch (e) {
      emit(AuthenticationError(error: e.toString()));
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _onSignIn(
      SignIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    try {
      await authRepositoryImpl.signIn(user: event.userModel);
      emit(AuthenticationAuthenticated(
          displayName: _firebaseAuth.currentUser?.displayName ?? ""));
    } catch (e) {
      emit(AuthenticationError(error: e.toString()));
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _onSignOut(
      SignOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    try {
      await authRepositoryImpl.signOut();
      emit(AuthenticationUnauthenticated());
    } catch (e) {
      rethrow;
    }
  }
}
