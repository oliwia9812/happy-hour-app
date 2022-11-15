import 'package:flutter/material.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

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
          Navigator.pushNamed(context, ForgotPasswordScreen.route);
        },
      ),
    );
  }
}
