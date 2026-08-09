import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProcedureQuickStatsRow extends StatelessWidget {
  final ProcedureDetailsModel procedure;

  const ProcedureQuickStatsRow({
    super.key,
    required this.procedure,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStatCard(
          icon: LucideIcons.bookText,
          title: 'Required Docs',
          value: '${procedure.requiredDocsCount} docs',
        ),
        SizedBox(width: 8.w),
        _buildStatCard(
          icon: LucideIcons.circleDollarSign,
          title: 'Official Fee',
          value: procedure.officialFee,
        ),
        SizedBox(width: 8.w),
        _buildStatCard(
          icon: LucideIcons.mapPin,
          title: 'Locations',
          value: '${procedure.nearbyLocationsCount} nearby',
        ),
        SizedBox(width: 8.w),
        _buildStatCard(
          icon: LucideIcons.bot,
          title: 'AI Tips',
          value: '${procedure.aiTipsCount} tips',
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.lightSurface,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: AppColors.lightTextTertiary,
            width: 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              spreadRadius: 0,
              offset: const Offset(0, 3),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.lightPrimary,
              size: 26.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium12.copyWith(
                color: AppColors.lightTextPrimary,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              value,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium12.copyWith(
                color: AppColors.lightPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
