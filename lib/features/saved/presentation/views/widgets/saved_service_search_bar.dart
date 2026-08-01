import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class SavedServiceSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const SavedServiceSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.lightBorder,
          width: 1.w,
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTextStyles.regular14.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        decoration: InputDecoration(
          hintText: 'Search saved services',
          hintStyle: AppTextStyles.regular14.copyWith(
            color: AppColors.lightTextTertiary,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              color: AppColors.lightTextSecondary,
              size: 20.sp,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 44.w,
            minHeight: 44.h,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
        ),
      ),
    );
  }
}
