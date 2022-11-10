import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/sign_in_bloc.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/screens/home/home_bloc.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetCurrentUser());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          context.go(Constants.signUpRouteName);
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
              CustomButton(
                  buttonTitle: "Sign out",
                  callback: () {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignOut(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
