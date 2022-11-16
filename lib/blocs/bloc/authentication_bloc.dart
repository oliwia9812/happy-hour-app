import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';
import 'package:happy_hour_app/repositories/database/database_repository.dart';
import 'package:happy_hour_app/repositories/shared_preferences/shared_preferences_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final DatabaseRepository _databaseRepository;
  final SharedPreferencesRepository _sharedPreferencesRepository;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required DatabaseRepository databaseRepository,
    required SharedPreferencesRepository sharedPreferencesRepository,
  })  : _authenticationRepository = authenticationRepository,
        _databaseRepository = databaseRepository,
        _sharedPreferencesRepository = sharedPreferencesRepository,
        super(AuthenticationUnknown()) {
    on<AuthenticationChanged>(_onAuthenticationChanged);
    on<SignOut>(_onSignOut);

    StreamSubscription _userSubscription = _databaseRepository.user
        .listen((user) => add(AuthenticationChanged(user: user)));
  }

  Future<void> _onAuthenticationChanged(
      AuthenticationChanged event, Emitter<AuthenticationState> emit) async {
    if (event.user != null) {
      _sharedPreferencesRepository.setUserIsLogged(isLoggedIn: true);
      emit(AuthenticationAuthenticated(name: event.user?.displayName ?? ""));
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
