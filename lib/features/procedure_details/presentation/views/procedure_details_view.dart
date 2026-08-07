import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';
import 'package:awraq/features/procedure_details/presentation/views/widgets/fees_and_charges_card.dart';
import 'package:awraq/features/procedure_details/presentation/views/widgets/procedure_banner_card.dart';
import 'package:awraq/features/procedure_details/presentation/views/widgets/procedure_quick_stats_row.dart';
import 'package:awraq/features/procedure_details/presentation/views/widgets/procedure_locations_section.dart';
import 'package:awraq/features/procedure_details/presentation/views/widgets/required_document_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProcedureDetailsView extends StatefulWidget {
  final ProcedureDetailsModel? procedure;

  const ProcedureDetailsView({
    super.key,
    this.procedure,
  });

  @override
  State<ProcedureDetailsView> createState() => _ProcedureDetailsViewState();
}

class _ProcedureDetailsViewState extends State<ProcedureDetailsView> {
  late ProcedureDetailsModel _procedureData;
  late bool _isSaved;

  @override
  void initState() {
    super.initState();
    _procedureData = widget.procedure ?? ProcedureDetailsModel.mockData;
    _isSaved = _procedureData.isSaved;
  }

  void _toggleSaveStatus() {
    setState(() {
      _isSaved = !_isSaved;
      _procedureData.isSaved = _isSaved;
    });

    _showSuccessDialog(
      _isSaved
          ? 'Procedure saved successfully to your saved list!'
          : 'Procedure removed from your saved list.',
      title: _isSaved ? 'Saved!' : 'Removed!',
    );
  }

  void _showSuccessDialog(String message, {required String title}) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: AppColors.lightSurface,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80.r,
                  height: 80.r,
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightPrimary.withValues(alpha: 0.35),
                        blurRadius: 20,
                        spreadRadius: 4,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: 40.sp,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  title,
                  style: AppTextStyles.semiBold18.copyWith(
                    color: AppColors.lightTextPrimary,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.lightTextSecondary,
                  ),
                ),
                SizedBox(height: 28.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightPrimary,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Back',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Center(
            child: GestureDetector(
              onTap: () {
                if (context.canPop()) {
                  context.pop();
                }
              },
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  LucideIcons.chevronLeft,
                  color: AppColors.lightTextPrimary,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'Procedure Details',
          style: AppTextStyles.bold24.copyWith(
            fontSize: 22.sp,
            color: AppColors.lightTextPrimary,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Center(
              child: GestureDetector(
                onTap: _toggleSaveStatus,
                child: Icon(
                  _isSaved ? Icons.bookmark : Icons.bookmark_border_rounded,
                  color: _isSaved
                      ? AppColors.lightPrimary
                      : AppColors.lightTextSecondary,
                  size: 24.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Banner Card
            ProcedureBannerCard(
              title: _procedureData.title,
              description: _procedureData.description,
            ),
            SizedBox(height: 16.h),

            // 2. Procedure Quick Stats Row
            ProcedureQuickStatsRow(procedure: _procedureData),
            SizedBox(height: 20.h),

            // 3. Required Documents Section
            Text(
              'Required Documents',
              style: AppTextStyles.medium18.copyWith(
                color: AppColors.lightTextPrimary,
              ),
            ),
            SizedBox(height: 12.h),
            Column(
              children: _procedureData.requiredDocuments.map((doc) {
                return RequiredDocumentItem(document: doc);
              }).toList(),
            ),
            SizedBox(height: 16.h),

            // 4. Fees & Charges Section
            Text(
              'Fees & Charges',
              style: AppTextStyles.medium18.copyWith(
                color: AppColors.lightTextPrimary,
              ),
            ),
            SizedBox(height: 12.h),
            FeesAndChargesCard(fees: _procedureData.feesAndCharges),
            SizedBox(height: 24.h),

            // 5. Locations Section
            ProcedureLocationsSection(
              locations: _procedureData.safeLocations,
              onViewOnMapPressed: () {
                // Map view action
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
