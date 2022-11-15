import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthenticationRepository _authenticationRepository;
  SignInCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(SignInInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());

    try {
      await _authenticationRepository.signIn(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
      emit(SignInInitial());
    } catch (e) {
      emit(SignInFailure(error: e.toString()));
    }
  }
}
