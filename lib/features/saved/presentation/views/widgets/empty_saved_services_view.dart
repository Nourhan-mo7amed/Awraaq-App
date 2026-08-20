import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EmptySavedServicesView extends StatelessWidget {
  const EmptySavedServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Container with Light Blue Background
            Container(
              width: 90.r,
              height: 90.r,
              decoration: BoxDecoration(
                color: const Color(0xFFE9F0FF),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Icon(
                  LucideIcons.bookmarkX,
                  color: AppColors.lightPrimary,
                  size: 42.sp,
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Title: No Saved Procedures
            Text(
              'No Saved Procedures',
              textAlign: TextAlign.center,
              style: AppTextStyles.bold24.copyWith(
                fontSize: 22.sp,
                color: AppColors.lightTextPrimary,
              ),
            ),
            SizedBox(height: 12.h),

            // Subtitle
            Text(
              "You haven't saved any procedures yet. Browse and save procedures to access them quickly.",
              textAlign: TextAlign.center,
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.lightTextSecondary,
                height: 1.4,
              ),
            ),
            SizedBox(height: 28.h),

            // Action Button: Browse Procedures
            ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.home);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightPrimary,
                padding: EdgeInsets.symmetric(
                  horizontal: 36.w,
                  vertical: 14.h,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Browse Procedures',
                style: AppTextStyles.semiBold14.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
