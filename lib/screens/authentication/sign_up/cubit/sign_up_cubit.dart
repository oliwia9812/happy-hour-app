import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthenticationRepository _authenticationRepository;
  SignUpCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(SignUpInitial());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());

    try {
      await _authenticationRepository.signUp(
        email: email,
        password: password,
        name: name,
      );

      emit(SignUpSuccess());
      emit(SignUpInitial());
    } catch (e) {
      emit(SignUpFailure(error: e.toString()));
    }
  }
}
