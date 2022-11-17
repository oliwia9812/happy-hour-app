import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/blocs/authentication/authentication_bloc.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/screens/home/widgets/home_greeting_widget.dart';
import 'package:happy_hour_app/styles/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationUnauthenticated) {
          Navigator.pushNamed(context, SignInScreen.route);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HomeGreetingWidget(),
              CustomButton(
                  buttonTitle: "Sign out",
                  loading: loading,
                  callback: () {
                    context.read<AuthenticationBloc>().add(
                          SignOut(),
                        );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
