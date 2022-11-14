import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_hour_app/repository/auth_repository_impl.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepositoryImpl authRepositoryImpl;
  ForgotPasswordBloc({required this.authRepositoryImpl})
      : super(ForgotPasswordInitial()) {
    on<ResetPassword>(_onResetPassword);
  }

  Future<void> _onResetPassword(
      ResetPassword event, Emitter<ForgotPasswordState> emit) async {
    try {
      await authRepositoryImpl.resetPassword(email: event.email);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordFailed(error: e.toString()));
    }
  }
}
