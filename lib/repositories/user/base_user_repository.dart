import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_hour_app/models/user_model.dart';

abstract class BaseUserRepository {
  User? get currentUser;
  Stream<User?> get user;
  Future<void> updateUser({required UserModel user});
  Future<UserModel> fetchUser({required String userId});
  String? get getCurrentUserName;
}
