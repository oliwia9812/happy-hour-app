import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final FirebaseAuth _firebaseAuth;
  ForgotPasswordBloc(this._firebaseAuth) : super(ForgotPasswordInitial()) {
    on<ResetPassword>(_onResetPassword);
  }

  Future<void> _onResetPassword(
      ResetPassword event, Emitter<ForgotPasswordState> emit) async {
    final String email = event.email;
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      ResetPasswordFailed(error: e.message.toString());
    }
  }
}
