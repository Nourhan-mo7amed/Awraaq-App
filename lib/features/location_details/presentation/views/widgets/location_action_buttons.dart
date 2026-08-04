import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationActionButtons extends StatelessWidget {
  final VoidCallback? onOpenInMaps;
  final VoidCallback? onGetDirections;

  const LocationActionButtons({
    super.key,
    this.onOpenInMaps,
    this.onGetDirections,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Open In Maps - Outlined Button (full width, text only)
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: OutlinedButton(
            onPressed: onOpenInMaps ?? () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xffE9F0FF),
              foregroundColor: AppColors.lightPrimary,
              side: const BorderSide(color: AppColors.lightPrimary, width: 1.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              'Open in Maps',
              style: AppTextStyles.semiBold20.copyWith(
                color: AppColors.lightPrimary,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),

        // Get Directions - Filled Button (uses CustomButton)
        CustomButton(
          text: 'Get Directions',
          onPressed: onGetDirections ?? () {},
        ),
      ],
    );
  }
}
