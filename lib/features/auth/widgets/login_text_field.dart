import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';


class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggle,
    this.errorText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.focusNode,
    this.nextFocus,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  final bool isPassword;
  final bool obscureText;

  final VoidCallback? onToggle;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          focusNode: focusNode,
          textInputAction: textInputAction,
          obscureText: obscureText,
          onChanged: onChanged,
          style: const TextStyle(color: AppColors.lightTextPrimary),

          onFieldSubmitted: (_) {
            nextFocus?.requestFocus();
          },

          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColors.formFieldBackground,

            prefixIcon: Icon(icon, color: Colors.grey),

            suffixIcon: isPassword
                ? IconButton(
                    onPressed: onToggle,
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  )
                : null,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: hasError ? AppColors.error : AppColors.lightBorder,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: hasError ? AppColors.error : AppColors.lightPrimary,
                width: 1.5,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.error, width: 1.5),
            ),

            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
