import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          activeColor: AppColors.lightPrimary,
          onChanged: (value) {
            onChanged(value ?? false);
          },
        ),

        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.grey, fontSize: 13),
              children: [
                TextSpan(text: "I agree to the "),

                TextSpan(
                  text: "Terms & Conditions ",
                  style: TextStyle(
                    color: AppColors.lightPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextSpan(text: "and "),

                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    color: AppColors.lightPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextSpan(text: " of Awraq Government Services"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
