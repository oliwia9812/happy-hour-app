import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/Router/app_routing.dart';
import 'package:happy_hour_app/generated/fonts.gen.dart';
import 'package:happy_hour_app/injector.dart';
import 'package:happy_hour_app/observer.dart';
import 'package:happy_hour_app/screens/authentication/authentication_bloc.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/forgot_password_bloc.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/sign_in_bloc.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/sign_up_bloc.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouting.router;
    Bloc.observer = SimpleBlocObserver();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            locator.get<FirebaseAuth>(),
          ),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(
            authBloc: BlocProvider.of<AuthenticationBloc>(context),
          ),
        ),
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(
            authBloc: BlocProvider.of<AuthenticationBloc>(context),
          ),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => ForgotPasswordBloc(
            locator.get<FirebaseAuth>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: FontFamily.montserrat,
        ),
      ),
    );
  }
}
