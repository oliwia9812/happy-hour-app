import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  static String route = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.violet,
      body: Center(
        child: Text(
          "Happy\nHour.",
          style: AppTextStyles.splashTitle,
        ),
      ),
    );
  }
}
