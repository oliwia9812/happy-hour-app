import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_colors.dart';

class AppTextStyles {
  static const TextStyle body = TextStyle(
    color: AppColors.gray,
    fontSize: 17.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle button = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle hintText = TextStyle(
    color: AppColors.gray,
    fontSize: 17.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
  );

  static const TextStyle label = TextStyle(
    color: AppColors.darkGray,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textButton = TextStyle(
    color: AppColors.orange,
    fontSize: 17.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textField = TextStyle(
    color: AppColors.darkGray,
    fontSize: 17.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
  );

  static const TextStyle titleLarge = TextStyle(
    color: AppColors.darkGray,
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle splashTitle = TextStyle(
    color: AppColors.white,
    fontSize: 42.0,
    fontWeight: FontWeight.w700,
  );
}
