import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/cubit/sign_in_cubit.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/widgets/sign_in_footer.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/widgets/sign_in_form.dart';
import 'package:happy_hour_app/screens/authentication/widgets/auth_header.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_divider.dart';
import 'package:happy_hour_app/styles/app_colors.dart';

class SignInScreen extends StatelessWidget {
  static String route = "/signin";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AuthHeader(
                headerTitle: "Welcome back",
                subtitle: "Log in to your account",
              ),
              SignInForm(),
              CustomDivider(),
              SignInFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
