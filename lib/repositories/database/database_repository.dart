import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  DatabaseRepository(
      {required FirebaseFirestore firebaseFirestore,
      required FirebaseAuth firebaseAuth})
      : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  Stream<User?> get user => _firebaseAuth.authStateChanges();
}
