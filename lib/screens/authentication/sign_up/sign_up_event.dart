part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpWithEmailAndPasswordButtonPressed extends SignUpEvent {
  final UserModel user;

  SignUpWithEmailAndPasswordButtonPressed({required this.user});
}
