import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_decorations.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final IconData? buttonIcon;
  final String buttonTitle;
  final VoidCallback callback;
  final bool? primary;
  const CustomButton({
    this.buttonColor = AppColors.violet,
    this.buttonIcon,
    required this.buttonTitle,
    required this.callback,
    this.primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        style: AppDecorations.button(buttonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buttonIcon != null ? Icon(buttonIcon) : const SizedBox.shrink(),
            Text(
              buttonTitle,
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
