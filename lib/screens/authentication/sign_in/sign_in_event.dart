part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInButtonPressed extends SignInEvent {
  final UserModel userModel;

  SignInButtonPressed({required this.userModel});
}
