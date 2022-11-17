import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';
import 'package:happy_hour_app/repositories/user/user_repository.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/cubit/sign_up_cubit.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/widgets/sign_up_footer.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/widgets/sign_up_form.dart';
import 'package:happy_hour_app/screens/authentication/widgets/auth_header.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_divider.dart';
import 'package:happy_hour_app/styles/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static String route = "/signup";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        authenticationRepository: context.read<AuthenticationRepository>(),
        userRepository: context.read<UserRepository>(),
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
                  headerTitle: "Welcome in HappyHour!",
                  subtitle: "Create your free account",
                ),
                SignUpForm(),
                CustomDivider(),
                SignUpFooter(),
              ],
            ),
          )),
    );
  }
}
