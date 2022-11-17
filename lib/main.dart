import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/blocs/authentication/authentication_bloc.dart';
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';
import 'package:happy_hour_app/repositories/shared_preferences/shared_preferences_repository.dart';
import 'package:happy_hour_app/repositories/user/user_repository.dart';
import 'package:happy_hour_app/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

final initFirebase = Firebase.initializeApp();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initFirebase;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(Application(
    firebaseAuth: firebaseAuth,
    firebaseFirestore: firebaseFirestore,
    sharedPreferences: sharedPreferences,
  ));

  FlutterNativeSplash.remove();
}

class Application extends StatelessWidget {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final SharedPreferences _sharedPreferences;

  const Application({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
    required SharedPreferences sharedPreferences,
    super.key,
  })  : _sharedPreferences = sharedPreferences,
        _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
            firebaseAuth: _firebaseAuth,
            firebaseFirestore: _firebaseFirestore,
          ),
        ),
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => AuthenticationRepository(
            firebaseAuth: _firebaseAuth,
          ),
        ),
        RepositoryProvider<SharedPreferencesRepository>(
          create: (context) => SharedPreferencesRepository(
            sharedPreferences: _sharedPreferences,
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
              sharedPreferencesRepository:
                  context.read<SharedPreferencesRepository>(),
              userRepository: context.read<UserRepository>(),
            ),
          ),
        ],
        child: const AppRouter(),
      ),
    );
  }
}
