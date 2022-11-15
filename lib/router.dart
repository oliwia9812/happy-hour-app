import 'package:flutter/material.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/reset_password_screen.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:happy_hour_app/screens/home/home_screen.dart';
import 'package:happy_hour_app/screens/splash/splash_screen.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignInScreen.route,
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        SignUpScreen.route: (context) => const SignUpScreen(),
        SignInScreen.route: (context) => const SignInScreen(),
        ResetPasswordScreen.route: (context) => const ResetPasswordScreen(),
        ForgotPasswordScreen.route: (context) => const ForgotPasswordScreen(),
        HomeScreen.route: (context) => const HomeScreen(),
      },
    );
  }
}
