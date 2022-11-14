part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class SignUp extends AuthenticationEvent {
  final UserModel userModel;

  const SignUp({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class SignIn extends AuthenticationEvent {
  final UserModel userModel;

  const SignIn({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class SignOut extends AuthenticationEvent {}
