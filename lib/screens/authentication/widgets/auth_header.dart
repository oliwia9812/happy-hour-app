import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String headerTitle;
  final String subtitle;
  const AuthHeader({
    required this.headerTitle,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerTitle,
          style: AppTextStyles.titleLarge,
        ),
        Text(
          subtitle,
          style: AppTextStyles.body,
        )
      ],
    );
  }
}
