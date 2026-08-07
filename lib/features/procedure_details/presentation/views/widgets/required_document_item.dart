import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class RequiredDocumentItem extends StatelessWidget {
  final RequiredDocumentModel document;

  const RequiredDocumentItem({
    super.key,
    required this.document,
  });

  IconData _getIconForDocument(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('photo') || lower.contains('image')) {
      return LucideIcons.imageDown;
    } else if (lower.contains('id') || lower.contains('card')) {
      return LucideIcons.idCard;
    } else if (lower.contains('passport')) {
      return LucideIcons.tickets;
    } else if (lower.contains('receipt') || lower.contains('payment')) {
      return LucideIcons.handCoins;
    }
    return LucideIcons.fileText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColors.lightTextTertiary,
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          // Icon Container with blue circle background
          Container(
            width: 46.r,
            height: 47.r,
            decoration: BoxDecoration(
              color: const Color(0xFFD6E4FF),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Icon(
                _getIconForDocument(document.title),
                color: AppColors.lightPrimary,
                size: 25.sp,
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Title & Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  document.title,
                  style: AppTextStyles.medium15.copyWith(
                    color: AppColors.lightTextPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  document.description,
                  style: AppTextStyles.regular12.copyWith(
                    color: AppColors.lightTextSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Quantity badge
          Container(
            width: 28.r,
            height: 28.r,
            decoration: BoxDecoration(
              color: const Color(0xFFD6E4FF),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                document.id,
                style: AppTextStyles.semiBold14.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.lightPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
