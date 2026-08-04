import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.title,
    required this.enabled,
    required this.onPressed,
  });

  final String title;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.lightPrimary,
          disabledBackgroundColor: AppColors.buttonDisable,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}