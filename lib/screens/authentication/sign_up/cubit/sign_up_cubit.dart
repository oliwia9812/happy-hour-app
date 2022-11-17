import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_hour_app/models/user_model.dart';
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';
import 'package:happy_hour_app/repositories/user/user_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  SignUpCubit({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
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

      UserModel user = UserModel(
        name: _userRepository.currentUser!.displayName,
        email: _userRepository.currentUser!.email!,
        id: _userRepository.currentUser!.uid,
      );

      await _userRepository.updateUser(user: user);

      emit(SignUpSuccess());
      emit(SignUpInitial());
    } catch (e) {
      emit(SignUpFailure(error: e.toString()));
    }
  }
}
