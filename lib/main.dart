import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/blocs/bloc/authentication_bloc.dart';
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';
import 'package:happy_hour_app/repositories/shared_preferences/shared_preferences_repository.dart';
import 'package:happy_hour_app/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final initFirebase = Firebase.initializeApp();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initFirebase;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(Application(
    firebaseAuth: firebaseAuth,
    sharedPreferences: sharedPreferences,
  ));
}

class Application extends StatelessWidget {
  final SharedPreferences _sharedPreferences;
  final FirebaseAuth _firebaseAuth;

  const Application({
    required SharedPreferences sharedPreferences,
    required FirebaseAuth firebaseAuth,
    super.key,
  })  : _sharedPreferences = sharedPreferences,
        _firebaseAuth = firebaseAuth;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (context) =>
              AuthenticationRepository(firebaseAuth: _firebaseAuth),
        ),
        RepositoryProvider<SharedPreferencesRepository>(
          create: (context) => SharedPreferencesRepository(
              sharedPreferences: _sharedPreferences),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
          ),
        ],
        child: const AppRouter(),
      ),
    );
  }
}
