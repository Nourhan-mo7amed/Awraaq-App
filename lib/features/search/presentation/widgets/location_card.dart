import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class LocationCard extends StatelessWidget {
  final String name;
  final String address;
  final String workingHours;
  final String contact;

  const LocationCard({
    super.key,
    required this.name,
    required this.address,
    required this.workingHours,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.lightBorder,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.primary10,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  LucideIcons.mapPin,
                  color: AppColors.lightPrimary,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  name,
                  style: AppTextStyles.bold18.copyWith(
                    color: AppColors.lightTextPrimary,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: AppColors.lightBorder, height: 1),
          SizedBox(height: 16.h),
          _buildInfoRow(LucideIcons.mapPin, address),
          SizedBox(height: 8.h),
          _buildInfoRow(LucideIcons.clock, 'Working Hours $workingHours'),
          SizedBox(height: 8.h),
          _buildInfoRow(LucideIcons.phone, 'Contact $contact'),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View Details',
                    style: AppTextStyles.semiBold14.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    LucideIcons.arrowRight,
                    color: AppColors.white,
                    size: 16.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: AppColors.lightTextTertiary,
          size: 16.sp,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.regular12.copyWith(
              color: AppColors.lightTextSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
