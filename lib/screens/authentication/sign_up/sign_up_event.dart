part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpWithEmailAndPassword extends SignUpEvent {
  final UserModel user;

  SignUpWithEmailAndPassword({required this.user});
}
