import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String headerTitle;
  const AuthHeader({
    required this.headerTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      headerTitle,
      style: AppTextStyles.titleLarge,
    );
  }
}
