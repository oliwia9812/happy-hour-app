part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailed extends SignInState {}

class SignOutSuccess extends SignInState {}

class SignOutFailed extends SignInState {}
