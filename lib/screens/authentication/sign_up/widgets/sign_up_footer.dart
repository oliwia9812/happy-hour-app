import 'package:flutter/material.dart';
import 'package:happy_hour_app/generated/app_icons.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/styles/app_colors.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          buttonColor: AppColors.black,
          buttonIcon: AppIcons.apple,
          buttonTitle: "Sign up with Apple",
          primary: false,
          callback: () {},
        ),
        CustomButton(
          buttonColor: AppColors.blue,
          buttonIcon: AppIcons.facebook,
          buttonTitle: "Sign up with Facebook",
          primary: false,
          callback: () {},
        ),
        CustomButton(
          buttonColor: AppColors.red,
          buttonIcon: AppIcons.google,
          buttonTitle: "Sign up with Google",
          primary: false,
          callback: () {},
        ),
      ],
    );
  }
}
