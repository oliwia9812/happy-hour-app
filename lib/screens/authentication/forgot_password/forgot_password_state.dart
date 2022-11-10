part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ResetPasswordSuccess extends ForgotPasswordState {}

class ResetPasswordFailed extends ForgotPasswordState {}
