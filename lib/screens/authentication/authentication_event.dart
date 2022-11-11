part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class SignUpWithEmailAndPassword extends AuthenticationEvent {
  final UserModel userModel;

  const SignUpWithEmailAndPassword({required this.userModel});
}

class SignInWithEmailAndPassword extends AuthenticationEvent {
  final UserModel userModel;

  const SignInWithEmailAndPassword({required this.userModel});
}

class SignOut extends AuthenticationEvent {}
