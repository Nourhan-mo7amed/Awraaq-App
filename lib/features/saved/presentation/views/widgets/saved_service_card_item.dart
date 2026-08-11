import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/saved/data/models/saved_service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SavedServiceCardItem extends StatelessWidget {
  final SavedServiceModel service;
  final VoidCallback onDelete;
  final VoidCallback onViewDetails;

  const SavedServiceCardItem({
    super.key,
    required this.service,
    required this.onDelete,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColors.lightBorder,
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Title + Delete Trash Icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  service.title,
                  style: AppTextStyles.semiBold14.copyWith(
                    color: AppColors.lightTextPrimary,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: onDelete,
                child: Icon(
                  LucideIcons.trash2,
                  color: AppColors.error,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),

          // Subtitle / Description
          Text(
            service.description,
            style: AppTextStyles.regular12.copyWith(
              color: AppColors.lightTextSecondary,
            ),
          ),
          SizedBox(height: 14.h),

          // Bottom Row: Category + Saved Date + View Details Button
          Row(
            children: [
              // Category
              Text(
                service.category,
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.lightTextSecondary,
                ),
              ),
              const Spacer(),

              // Saved Date
              Text(
                service.savedDate,
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.lightPrimary,
                ),
              ),
              SizedBox(width: 12.w),

              // View Details Button
              GestureDetector(
                onTap: onViewDetails,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View',
                            style: AppTextStyles.medium12.copyWith(
                              color: AppColors.white,
                              height: 1.1,
                            ),
                          ),
                          Text(
                            'Details',
                            style: AppTextStyles.medium12.copyWith(
                              color: AppColors.white,
                              height: 1.1,
                            ),
                          ),
                        ],
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
        ],
      ),
    );
  }
}
