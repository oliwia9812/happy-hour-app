import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class CustomLabel extends StatelessWidget {
  final String textFieldName;
  const CustomLabel({
    required this.textFieldName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textFieldName,
      style: AppTextStyles.label,
    );
  }
}
