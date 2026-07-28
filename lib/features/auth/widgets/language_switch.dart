import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';


class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({
    super.key,
    required this.isEnglish,
    required this.onChanged,
  });

  final bool isEnglish;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 74,
        height: 34,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.lightBorder,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isEnglish
                      ? AppColors.lightPrimary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "EN",
                  style: TextStyle(
                    color:
                        isEnglish ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !isEnglish
                      ? AppColors.lightPrimary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "عربي",
                  style: TextStyle(
                    color:
                        !isEnglish ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}