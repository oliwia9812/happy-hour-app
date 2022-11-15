import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_decorations.dart';

class CustomButton extends StatefulWidget {
  final Color buttonColor;
  final IconData? buttonIcon;
  final String buttonTitle;
  final VoidCallback callback;
  final bool? primary;
  final bool loading;
  const CustomButton({
    this.buttonColor = AppColors.violet,
    this.buttonIcon,
    required this.buttonTitle,
    required this.callback,
    this.primary,
    this.loading = false,
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ElevatedButton(
        onPressed: () {
          widget.callback();
        },
        style: AppDecorations.button(widget.buttonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.buttonIcon != null
                ? Icon(widget.buttonIcon)
                : const SizedBox.shrink(),
            widget.loading
                ? const SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    widget.buttonTitle,
                  ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
