import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_hour_app/models/user_model.dart';
import 'package:happy_hour_app/repositories/user/base_user_repository.dart';
import 'package:happy_hour_app/extensions/string_extensions.dart';

class UserRepository implements BaseUserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Stream<User?> get user => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  String? get getCurrentUserName => currentUser!.displayName!.capitalize();

  @override
  Future<void> updateUser({required UserModel user}) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toJson());
  }

  @override
  Future<UserModel> fetchUser({required String userId}) async {
    DocumentSnapshot documentSnapshot =
        await _firebaseFirestore.collection('users').doc(userId).get();

    return UserModel.fromSnapshot(documentSnapshot);
  }
}
