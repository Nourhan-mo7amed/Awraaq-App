import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LocationInfoSection extends StatelessWidget {
  final String name;
  final String category;
  final String status;
  final double rating;
  final int reviewsCount;
  final String address;
  final String workingHours;
  final String phoneNumber;

  const LocationInfoSection({
    super.key,
    required this.name,
    required this.category,
    required this.status,
    required this.rating,
    required this.reviewsCount,
    required this.address,
    required this.workingHours,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row 1: Name + Open Badge
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                name,
                style: AppTextStyles.bold18.copyWith(
                  color: AppColors.lightTextPrimary,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color.fromARGB(16, 82, 225, 82),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.success, width: 1.2),
              ),
              child: Text(
                status,
                style: AppTextStyles.bold18.copyWith(
                  color: AppColors.success,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),

        // Row 2: Rating left + Category right
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color: AppColors.warning,
                  size: 18.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  '$rating ($reviewsCount)',
                  style: AppTextStyles.regular14.copyWith(
                    color: const Color(0xff444748),
                  ),
                ),
              ],
            ),
            Text(
              category,
              style: AppTextStyles.regular14.copyWith(
                color: const Color(0xff444748),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        // Row 3: Address
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              LucideIcons.mapPin,
              color: AppColors.lightPrimary,
              size: 18.sp,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                address,
                style: AppTextStyles.regular14.copyWith(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  height: 1.5,
                  letterSpacing: 0,
                  color: const Color(0xFF64748B),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        // Row 4: Working Hours
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              LucideIcons.clock,
              size: 18.sp,
              color: AppColors.lightTextPrimary,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                workingHours,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.lightTextPrimary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        // Row 5: Phone Number
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              LucideIcons.phone,
              size: 18.sp,
              color: AppColors.lightPrimary,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                phoneNumber,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.lightPrimary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
