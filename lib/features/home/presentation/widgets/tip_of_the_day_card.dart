import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TipOfTheDayCard extends StatelessWidget {
  const TipOfTheDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.lightPrimary.withValues(alpha: 0.35),
          width: 1.5,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Star icon in blue box
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.lightPrimary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              LucideIcons.star,
              color: AppColors.white,
              size: 22.sp,
            ),
          ),
          SizedBox(width: 14.w),

          /// Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tip of the Day',
                  style: AppTextStyles.semiBold14.copyWith(
                    color: AppColors.lightPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Make sure your documents are valid before starting any application.',
                  style: AppTextStyles.regular12.copyWith(
                    color: AppColors.lightTextSecondary,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}