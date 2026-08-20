import 'package:awraq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LocationHeaderImage extends StatelessWidget {
  final String imageUrl;

  const LocationHeaderImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 408.w,
      height: 184.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.lightBorder,
            child: Center(
              child: Icon(
                LucideIcons.building2,
                size: 48.sp,
                color: AppColors.lightTextTertiary,
              ),
            ),
          ),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: AppColors.lightBackground,
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.lightPrimary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
