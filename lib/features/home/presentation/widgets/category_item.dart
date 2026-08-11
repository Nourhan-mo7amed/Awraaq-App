import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../data/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  /// Returns an appropriate icon for each category name
  IconData _getCategoryIcon(String name) {
    final lowerName = name.toLowerCase();
    if (lowerName.contains('all')) return LucideIcons.alignJustify;
    if (lowerName.contains('id') || lowerName.contains('هوية')) {
      return LucideIcons.idCard;
    }
    if (lowerName.contains('car') || lowerName.contains('سيارة')) {
      return LucideIcons.car;
    }
    if (lowerName.contains('passport') || lowerName.contains('جواز')) {
      return LucideIcons.bookOpen;
    }
    if (lowerName.contains('birth') || lowerName.contains('ميلاد')) {
      return LucideIcons.baby;
    }
    if (lowerName.contains('vehicle') || lowerName.contains('مركبة')) {
      return LucideIcons.car;
    }
    return LucideIcons.fileText;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightPrimary : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isSelected
                ? AppColors.lightPrimary
                : AppColors.lightBorder,
            width: 1.2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.lightPrimary.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getCategoryIcon(category.name),
              size: 18.sp,
              color: isSelected ? AppColors.white : AppColors.lightTextSecondary,
            ),
            SizedBox(width: 6.w),
            Text(
              category.name,
              style: AppTextStyles.semiBold12.copyWith(
                color: isSelected
                    ? AppColors.white
                    : AppColors.lightTextPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}