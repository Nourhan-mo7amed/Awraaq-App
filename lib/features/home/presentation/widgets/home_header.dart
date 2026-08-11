import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:awraq/core/routing/app_routes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Avatar
        CircleAvatar(
          radius: 22.r,
          backgroundImage:
              const NetworkImage('https://i.pravatar.cc/150?img=11'),
        ),
        SizedBox(width: 12.w),

        /// Name
        Text(
          'Ahmed Mohamed',
          style: AppTextStyles.bold18.copyWith(
            color: AppColors.lightTextPrimary,
          ),
        ),

        const Spacer(),

        /// Location icon
        _HeaderIconButton(
          icon: LucideIcons.mapPin,
          onTap: () {},
        ),
        SizedBox(width: 4.w),

        /// Notifications icon
        _HeaderIconButton(
          icon: LucideIcons.bell,
          onTap: () => context.push(AppRoutes.notifications),
        ),
      ],
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.primary10,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          icon,
          color: AppColors.lightPrimary,
          size: 20.sp,
        ),
      ),
    );
  }
}