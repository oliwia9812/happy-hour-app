part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUnInitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final String? displayName;

  const AuthenticationAuthenticated({required this.displayName});
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
