part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignIn extends SignInEvent {
  final UserModel userModel;

  SignIn({required this.userModel});
}

class SignOut extends SignInEvent {}
