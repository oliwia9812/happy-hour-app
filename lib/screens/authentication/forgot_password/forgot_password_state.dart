part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ResetPasswordSuccess extends ForgotPasswordState {}

class ResetPasswordFailed extends ForgotPasswordState {
  final String error;

  ResetPasswordFailed({required this.error});

  @override
  List<Object> get props => [error];
}
