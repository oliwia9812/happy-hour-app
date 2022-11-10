import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  const CustomTextField({
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.orange,
      decoration: InputDecoration(
        errorMaxLines: 2,
        errorStyle: const TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.lightGray,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.gray,
          ),
        ),
        hintStyle: AppTextStyles.hintText,
        hintText: hintText,
      ),
      style: AppTextStyles.textField,
      validator: validator,
      obscureText: isPassword ? true : false,
      onChanged: onChanged,
    );
  }
}
