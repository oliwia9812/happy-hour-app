import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/generated/app_icons.dart';
import 'package:happy_hour_app/repositories/authentication/authentication_repository.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/widgets/forgot_password_form.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:happy_hour_app/screens/authentication/widgets/auth_header.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_decorations.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String route = "/forgot-password";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordCubit>(
      create: (context) => ForgotPasswordCubit(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 84.0),
          child: Stack(
            children: [
              _buildBackButton(context),
              _buildHeader(),
              const ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ElevatedButton(
        style: AppDecorations.roundedButton,
        onPressed: () {
          Navigator.pushNamed(context, SignInScreen.route);
        },
        child: const Icon(
          AppIcons.arrowBack,
          color: AppColors.gray,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Positioned(
      top: 64.0,
      child: AuthHeader(
        headerTitle: "Reset your password",
        subtitle: "Enter your registered email",
      ),
    );
  }
}
