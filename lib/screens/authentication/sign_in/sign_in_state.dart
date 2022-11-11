part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInFailure extends SignInState {
  final String error;

  SignInFailure({required this.error});
}
