import 'package:flutter/material.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0, top: 18.0),
      child: GestureDetector(
        child: const Text(
          "Forgot Password?",
          style: AppTextStyles.body,
        ),
        onTap: () {
          context.go(Constants.forgotPasswordRouteName);
        },
      ),
    );
  }
}
