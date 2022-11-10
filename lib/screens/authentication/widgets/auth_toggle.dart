import 'package:flutter/material.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class AuthToggle extends StatelessWidget {
  final VoidCallback callback;
  final String label;
  final String textButton;
  const AuthToggle({
    super.key,
    required this.callback,
    required this.label,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppTextStyles.body,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            callback();
          },
          child: Text(
            textButton,
            style: AppTextStyles.textButton,
          ),
        )
      ],
    );
  }
}
