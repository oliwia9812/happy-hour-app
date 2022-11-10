import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class AppDecorations {
  static ButtonStyle button(Color color) => ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0.5,
        minimumSize: const Size(double.infinity, 12.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: AppTextStyles.button,
      );

  static ButtonStyle roundedButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.lightGray,
    elevation: 0.5,
    padding: const EdgeInsets.all(6.0),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    minimumSize: Size.zero,
    shape: const CircleBorder(),
  );
}
