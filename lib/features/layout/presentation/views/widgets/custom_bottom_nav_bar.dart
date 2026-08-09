import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CustomBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomBottomNavBar({
    super.key,
    required this.navigationShell,
  });

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
        border: Border(
          top: BorderSide(
            color: AppColors.lightBorder,
            width: 1.w,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: AppColors.primary10,
            surfaceTintColor: AppColors.lightSurface,
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return AppTextStyles.bold18.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.lightPrimary,
                    fontWeight: FontWeight.w800,
                  );
                }
                return AppTextStyles.bold18.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w700,
                );
              },
            ),
          ),
          child: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _onDestinationSelected,
            backgroundColor: AppColors.lightSurface,
            elevation: 0,
            height: 70.h,
            destinations: [
              NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome03,
                  color: AppColors.lightTextPrimary,
                  size: 26.sp,
                ),
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome03,
                  color: AppColors.lightPrimary,
                  size: 26.sp,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: AppColors.lightTextPrimary,
                  size: 26.sp,
                ),
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: AppColors.lightPrimary,
                  size: 26.sp,
                ),
                label: 'Search',
              ),
              NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedBookmark02,
                  color: AppColors.lightTextPrimary,
                  size: 26.sp,
                ),
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedBookmark02,
                  color: AppColors.lightPrimary,
                  size: 26.sp,
                ),
                label: 'Saved',
              ),
              NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedAiChat02,
                  color: AppColors.lightTextPrimary,
                  size: 26.sp,
                ),
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedAiChat02,
                  color: AppColors.lightPrimary,
                  size: 26.sp,
                ),
                label: 'AI Chat',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
