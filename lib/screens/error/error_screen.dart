import 'package:flutter/material.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 84.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'Something went wrong!',
                  style: AppTextStyles.body,
                ),
              ),
            ),
            CustomButton(
              buttonTitle: "Go back",
              callback: () {
                context.go(Constants.signUpRouteName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
