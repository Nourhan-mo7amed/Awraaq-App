import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/saved/data/models/saved_service_model.dart';
import 'package:awraq/features/saved/presentation/views/widgets/empty_saved_services_view.dart';
import 'package:awraq/features/saved/presentation/views/widgets/saved_service_card_item.dart';
import 'package:awraq/features/saved/presentation/views/widgets/saved_service_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class SavedServicesView extends StatefulWidget {
  const SavedServicesView({super.key});

  @override
  State<SavedServicesView> createState() => _SavedServicesViewState();
}

class _SavedServicesViewState extends State<SavedServicesView> {
  final TextEditingController _searchController = TextEditingController();
  late List<SavedServiceModel> _savedServices;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _savedServices = List.from(SavedServiceModel.mockServices);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<SavedServiceModel> get _filteredServices {
    if (_searchQuery.trim().isEmpty) {
      return _savedServices;
    }
    return _savedServices.where((service) {
      final query = _searchQuery.toLowerCase();
      return service.title.toLowerCase().contains(query) ||
          service.description.toLowerCase().contains(query) ||
          service.category.toLowerCase().contains(query);
    }).toList();
  }

  void _showDeleteConfirmDialog(SavedServiceModel service) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          backgroundColor: AppColors.lightSurface,
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Delete from saved?',
                  style: AppTextStyles.semiBold20.copyWith(
                    color: AppColors.lightTextPrimary,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Are you sure you want to remove "${service.title}" from your saved services?',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.medium18.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.lightTextSecondary,
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      setState(() {
                        _savedServices.removeWhere((s) => s.id == service.id);
                      });
                      _showSuccessDialog('Item removed from saved services');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Delete',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      side: const BorderSide(color: AppColors.lightPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.lightPrimary,
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

  void _showSuccessDialog(String message) {
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
                  'Success!',
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
    final isEmptyState = _savedServices.isEmpty;
    final filteredList = _filteredServices;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Center(
            child: GestureDetector(
              onTap: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(AppRoutes.home);
                }
              },
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowLeft01,
                  color: AppColors.lightTextPrimary,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'Saved Services',
          style: AppTextStyles.medium18.copyWith(
            fontSize: 20.sp,
            color: AppColors.lightTextPrimary,
          ),
        ),
        actions: isEmptyState
            ? [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: AppColors.lightSurface,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColors.lightBorder,
                          width: 1.w,
                        ),
                      ),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedBookmark02,
                        color: AppColors.lightTextPrimary,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: isEmptyState
          ? const EmptySavedServicesView()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),

                  // Search Bar
                  SavedServiceSearchBar(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Bookmark Icon Badge Container
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.lightSurface,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.lightBorder,
                        width: 1.w,
                      ),
                    ),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedBookmark02,
                      color: AppColors.lightTextPrimary,
                      size: 22.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Saved Services List
                  Expanded(
                    child: filteredList.isEmpty
                        ? Center(
                            child: Text(
                              'No saved services match your search',
                              style: AppTextStyles.regular14.copyWith(
                                color: AppColors.lightTextTertiary,
                              ),
                            ),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              final service = filteredList[index];
                              return SavedServiceCardItem(
                                service: service,
                                onDelete: () =>
                                    _showDeleteConfirmDialog(service),
                                onViewDetails: () {
                                  context.push(AppRoutes.locationDetails);
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}
