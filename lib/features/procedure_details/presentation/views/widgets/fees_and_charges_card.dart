import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeesAndChargesCard extends StatelessWidget {
  final List<FeeChargeModel> fees;

  const FeesAndChargesCard({
    super.key,
    required this.fees,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColors.gray,
          width: 1.w,
        ),
      ),
      child: Column(
        children: List.generate(fees.length, (index) {
          final fee = fees[index];
          final isLast = index == fees.length - 1;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        fee.title,
                        style: AppTextStyles.semiBold14.copyWith(
                          color: AppColors.lightTextPrimary,
                        ),
                      ),
                    ),
                    Text(
                      fee.amount,
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.lightTextPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Divider(
                  color: AppColors.lightGray,
                  thickness: 1.w,
                  height: 10.h,
                  indent: 8.w,
                  endIndent: 8.w,
                ),
            ],
          );
        }),
      ),
    );
  }
}
