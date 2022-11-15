import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthenticationRepository _authenticationRepository;
  ForgotPasswordCubit(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(ForgotPasswordInitial());

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    try {
      await _authenticationRepository.resetPassword(email: email);
      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ForgotPasswordFailure(error: e.toString()));
    }
  }
}
