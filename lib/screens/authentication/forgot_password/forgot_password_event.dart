part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent extends Equatable {}

class ResetPassword extends ForgotPasswordEvent {
  final String email;

  ResetPassword({required this.email});

  @override
  List<Object> get props => [email];
}
