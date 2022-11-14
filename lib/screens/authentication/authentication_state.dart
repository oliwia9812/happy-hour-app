part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final String displayName;

  const AuthenticationAuthenticated({required this.displayName});

  @override
  List<Object> get props => [displayName];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String error;

  const AuthenticationError({required this.error});

  @override
  List<Object> get props => [error];
}
