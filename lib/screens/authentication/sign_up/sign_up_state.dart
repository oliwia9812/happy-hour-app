part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpWithEmailAndPasswordFailedFailure extends SignUpState {
  final String error;

  SignUpWithEmailAndPasswordFailedFailure({required this.error});
}

class SignUpWithEmailAndPasswordFailedLoading extends SignUpState {}
