import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/forgot_password_bloc.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 84.0),
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTitle(),
                  _buildSubtitle(),
                ],
              ),
              _buildBackToSignInButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        "Check your email",
        style: AppTextStyles.titleLarge,
      ),
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      "We have sent a password recover instruction to your email",
      style: AppTextStyles.body,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBackToSignInButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        buttonTitle: "Back to sign in",
        callback: () {
          context.go(Constants.signInRouteName);
        },
      ),
    );
  }
}
