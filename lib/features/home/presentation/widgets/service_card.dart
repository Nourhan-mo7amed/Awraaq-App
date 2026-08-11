import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../data/model/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  const ServiceCard({super.key, required this.service});

  /// Returns an appropriate icon based on the service name
  IconData _getServiceIcon(String name) {
    final lowerName = name.toLowerCase();
    if (lowerName.contains('id') || lowerName.contains('هوية')) {
      return LucideIcons.idCard;
    }
    if (lowerName.contains('passport') || lowerName.contains('جواز')) {
      return LucideIcons.bookOpen;
    }
    if (lowerName.contains('vehicle') ||
        lowerName.contains('car') ||
        lowerName.contains('سيارة') ||
        lowerName.contains('مركبة')) {
      return LucideIcons.car;
    }
    if (lowerName.contains('birth') || lowerName.contains('ميلاد')) {
      return LucideIcons.baby;
    }
    if (lowerName.contains('certificate') || lowerName.contains('شهادة')) {
      return LucideIcons.award;
    }
    if (lowerName.contains('license') || lowerName.contains('رخصة')) {
      return LucideIcons.fileCheck;
    }
    if (lowerName.contains('renewal') || lowerName.contains('تجديد')) {
      return LucideIcons.refreshCw;
    }
    if (lowerName.contains('registration') || lowerName.contains('تسجيل')) {
      return LucideIcons.clipboardList;
    }
    return LucideIcons.fileText;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// Navigate to procedure details screen
        context.push(AppRoutes.procedureDetails, extra: service.id);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 8.h,
          bottom: 8.h,
          left: 12.w,
          right: 12.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightSurface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.lightBorder,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightPrimary.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Centered Icon Container
            Center(
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.primary10,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  _getServiceIcon(service.name),
                  size: 22.sp,
                  color: AppColors.lightPrimary,
                ),
              ),
            ),
            SizedBox(height: 8.h),

            /// Service name aligned to start
            Text(
              service.name,
              textAlign: TextAlign.start,
              style: AppTextStyles.semiBold14.copyWith(
                color: AppColors.lightPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),

            /// Service description aligned to start
            Text(
              service.description,
              textAlign: TextAlign.start,
              style: AppTextStyles.regular12.copyWith(
                color: AppColors.lightTextSecondary,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}