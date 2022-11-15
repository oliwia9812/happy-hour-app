import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AuthenticationUnknown()) {
    on<AuthenticationChanged>(_onAuthenticationChanged);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onAuthenticationChanged(
      AuthenticationChanged event, Emitter<AuthenticationState> emit) async {}

  Future<void> _onSignOut(
      SignOut event, Emitter<AuthenticationState> emit) async {
    await _authenticationRepository.signOut();
    emit(AuthenticationUnauthenticated());
  }
}
