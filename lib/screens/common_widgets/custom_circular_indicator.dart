import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_colors.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.violet,
      ),
    );
  }
}
