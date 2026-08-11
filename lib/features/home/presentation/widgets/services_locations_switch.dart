import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ServicesLocationsSwitch extends StatelessWidget {
  final bool isServicesSelected;
  final ValueChanged<bool> onChanged;

  const ServicesLocationsSwitch({
    super.key,
    required this.isServicesSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Services button
        Expanded(
          child: _SwitchButton(
            label: 'Services',
            icon: LucideIcons.layoutGrid,
            isSelected: isServicesSelected,
            onTap: () => onChanged(true),
          ),
        ),
        SizedBox(width: 14.w),

        /// Locations button
        Expanded(
          child: _SwitchButton(
            label: 'Locations',
            icon: LucideIcons.mapPin,
            isSelected: !isServicesSelected,
            onTap: () => onChanged(false),
          ),
        ),
      ],
    );
  }
}

class _SwitchButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SwitchButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightPrimary : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected
                ? AppColors.lightPrimary
                : AppColors.lightBorder,
            width: 1.2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.lightPrimary.withValues(alpha: 0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.white : AppColors.lightTextTertiary,
              size: 26.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: AppTextStyles.semiBold14.copyWith(
                color: isSelected
                    ? AppColors.white
                    : AppColors.lightTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}