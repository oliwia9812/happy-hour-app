import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';
import 'package:happy_hour_app/repositories/shared_preferences/shared_preferences_repository.dart';
import 'package:happy_hour_app/repositories/user/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final SharedPreferencesRepository _sharedPreferencesRepository;
  final UserRepository _userRepository;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required SharedPreferencesRepository sharedPreferencesRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _sharedPreferencesRepository = sharedPreferencesRepository,
        _userRepository = userRepository,
        super(AuthenticationUnknown()) {
    on<AuthenticationChanged>(_onAuthenticationChanged);
    on<SignOut>(_onSignOut);

    StreamSubscription _userSubscription = _userRepository.user
        .listen((user) => add(AuthenticationChanged(user: user)));
  }

  Future<void> _onAuthenticationChanged(
      AuthenticationChanged event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    if (event.user != null) {
      _sharedPreferencesRepository.setUserIsLogged(isLoggedIn: true);
      emit(AuthenticationAuthenticated());
    } else {
      _sharedPreferencesRepository.setUserIsLogged(isLoggedIn: false);
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _onSignOut(
      SignOut event, Emitter<AuthenticationState> emit) async {
    await _authenticationRepository.signOut();
    emit(AuthenticationUnauthenticated());
  }
}
