part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationChanged extends AuthenticationEvent {
  final auth.User? user;

  const AuthenticationChanged({this.user});

  @override
  List<Object?> get props => [user];
}

class SignOut extends AuthenticationEvent {}
