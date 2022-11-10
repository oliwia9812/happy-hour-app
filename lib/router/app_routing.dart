import 'package:go_router/go_router.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:happy_hour_app/screens/error/error_screen.dart';
import 'package:happy_hour_app/screens/home/home_screen.dart';

class AppRouting {
  static final _router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        redirect: (state) => state.namedLocation(Constants.homeRouteName),
      ),
      GoRoute(
        name: Constants.signUpRouteName,
        path: Constants.signUpRouteName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: Constants.signInRouteName,
        path: Constants.signInRouteName,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: Constants.forgotPasswordRouteName,
        path: Constants.forgotPasswordRouteName,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        name: Constants.homeRouteName,
        path: Constants.homeRouteName,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );

  static GoRouter get router => _router;
}