import 'package:happy_hour_app/models/user.dart';

abstract class AuthRepository {
  Future<void>? signIn({required UserModel user});
  Future<void>? signUp({required UserModel user});
  Future<void>? signOut();
  Future<void>? resetPassword({required String email});
}
