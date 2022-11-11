import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/screens/authentication/authentication_bloc.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_circular_indicator.dart';
import 'package:happy_hour_app/screens/home/home_screen.dart';
import 'package:happy_hour_app/screens/splash/splash_screen.dart';
import 'package:happy_hour_app/styles/app_colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context).add(
      AppStarted(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUnInitialized) {
            return const SplashScreen();
          }
          if (state is AuthenticationAuthenticated) {
            return const HomeScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return const SignUpScreen();
          }
          if (state is AuthenticationLoading) {
            return const CustomCircularIndicator();
          } else {
            return const Text("Something went wrong!");
          }
        },
      ),
    );
  }
}
