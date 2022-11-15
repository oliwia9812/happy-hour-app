part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUnknown extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final String name;

  AuthenticationAuthenticated({required this.name});

  @override
  List<Object> get props => [name];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
