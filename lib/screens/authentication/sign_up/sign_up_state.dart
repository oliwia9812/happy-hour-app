part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpWithEmailAndPasswordSuccess extends SignUpState {}

class SignUpWithEmailAndPasswordFailed extends SignUpState {}
