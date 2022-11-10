import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

final GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
}
