import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_hour_app/repository/auth_repository_impl.dart';

final GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  locator.registerFactory<AuthRepositoryImpl>(
      () => AuthRepositoryImpl(firebaseAuth: locator.get<FirebaseAuth>()));
}
