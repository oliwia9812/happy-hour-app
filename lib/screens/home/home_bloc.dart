import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseAuth _firebaseAuth;
  HomeBloc(this._firebaseAuth) : super(HomeInitial()) {
    on<GetCurrentUser>(_onGetCurrentUser);
  }

  Future<void> _onGetCurrentUser(
      GetCurrentUser event, Emitter<HomeState> emit) async {
    try {
      final currentUser = await _firebaseAuth.currentUser;
      if (currentUser != null) {
        emit(HomeLoaded());
      }

      print(currentUser);
    } on FirebaseAuthException catch (e) {
      emit(HomeError());
    }
  }
}
