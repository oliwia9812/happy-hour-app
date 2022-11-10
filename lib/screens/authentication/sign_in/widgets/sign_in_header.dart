import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 32.0),
      child: Text(
        "Create an Account",
        style: AppTextStyles.titleLarge,
      ),
    );
  }
}
