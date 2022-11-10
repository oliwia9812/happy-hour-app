part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent {}

class ResetPassword extends ForgotPasswordEvent {
  final String email;

  ResetPassword({required this.email});
}
