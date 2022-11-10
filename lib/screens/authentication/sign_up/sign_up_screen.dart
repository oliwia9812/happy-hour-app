import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/sign_up_bloc.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/widgets/sign_up_footer.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/widgets/sign_up_form.dart';
import 'package:happy_hour_app/screens/authentication/widgets/auth_header.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_divider.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpWithEmailAndPasswordSuccess) {
          context.go(Constants.homeRouteName);
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
              const AuthHeader(
                headerTitle: "Create an Account",
              ),
              SignUpForm(),
              const CustomDivider(),
              const SignUpFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
