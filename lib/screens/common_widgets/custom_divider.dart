import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Divider(
        color: AppColors.gray,
      ),
    );
  }
}
