import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
            indicatorColor: AppColors.lightSurface.withValues(alpha: 0),
            surfaceTintColor: AppColors.lightSurface,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return AppTextStyles.semiBold12.copyWith(
                    color: AppColors.lightPrimary,
                  );
                }
                return AppTextStyles.medium12.copyWith(
                  color: AppColors.black,
                );
              },
            ),
          ),
          child: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _onDestinationSelected,
            backgroundColor: AppColors.lightSurface,
            elevation: 0,
            height: 65.h,
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.house,
                  color: AppColors.black,
                  size: 26,
                ),
                selectedIcon: Icon(
                  CupertinoIcons.house_fill,
                  color: AppColors.lightPrimary,
                  size: 26,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.search,
                  color: AppColors.black,
                  size: 26,
                ),
                selectedIcon: Icon(
                  CupertinoIcons.search,
                  color: AppColors.lightPrimary,
                  size: 26,
                ),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.bookmark,
                  color: AppColors.black,
                  size: 26,
                ),
                selectedIcon: Icon(
                  CupertinoIcons.bookmark_fill,
                  color: AppColors.lightPrimary,
                  size: 26,
                ),
                label: 'Saved',
              ),
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                  color: AppColors.black,
                  size: 26,
                ),
                selectedIcon: Icon(
                  CupertinoIcons.chat_bubble_fill,
                  color: AppColors.lightPrimary,
                  size: 26,
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
