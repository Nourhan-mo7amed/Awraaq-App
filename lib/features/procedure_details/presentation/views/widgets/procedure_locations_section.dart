import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProcedureLocationsSection extends StatelessWidget {
  final List<ProcedureLocationModel>? locations;
  final VoidCallback? onViewOnMapPressed;

  const ProcedureLocationsSection({
    super.key,
    this.locations,
    this.onViewOnMapPressed,
  });

  @override
  Widget build(BuildContext context) {
    final locationList = (locations != null && locations!.isNotEmpty)
        ? locations!
        : ProcedureLocationModel.defaultLocations;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row: Title & "View on Map" button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Locations',
              style: AppTextStyles.medium18.copyWith(
                color: AppColors.lightTextPrimary,
              ),
            ),
            GestureDetector(
              onTap: onViewOnMapPressed,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.mapPin,
                      color: AppColors.white,
                      size: 16.sp,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'View on Map',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),

        // Horizontal List of Location Cards
        SizedBox(
          height: 150.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: locationList.length,
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final location = locationList[index];
              return Container(
                width: 130.w,
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
                    // Top Image
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(13.r),
                      ),
                      child: Image.network(
                        location.imageUrl,
                        height: 85.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 85.h,
                            width: double.infinity,
                            color: const Color(0xFF1B2E4B),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LucideIcons.building2,
                                    color: AppColors.white,
                                    size: 26.sp,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Civil Registry',
                                    style: AppTextStyles.medium12.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Location Title
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Text(
                          location.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.semiBold12.copyWith(
                            color: AppColors.lightTextPrimary,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
