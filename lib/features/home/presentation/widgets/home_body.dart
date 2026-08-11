import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/home/presentation/cubit/home_cubit.dart';
import 'package:awraq/features/home/presentation/cubit/home_state.dart';
import 'package:awraq/features/home/presentation/widgets/category_list.dart';
import 'package:awraq/features/home/presentation/widgets/home_header.dart';
import 'package:awraq/features/home/presentation/widgets/services_grid.dart';
import 'package:awraq/features/home/presentation/widgets/services_locations_switch.dart';
import 'package:awraq/features/home/presentation/widgets/tip_of_the_day_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        /// Loading state
        if (state is HomeLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.lightPrimary,
            ),
          );
        }

        /// Error state
        if (state is HomeFailure) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.alertTriangle,
                    size: 48.sp,
                    color: AppColors.warning,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    state.error,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium15.copyWith(
                      color: AppColors.lightTextSecondary,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  ElevatedButton.icon(
                    onPressed: () => cubit.getHomeData(),
                    icon: const Icon(LucideIcons.refreshCw, size: 18),
                    label: const Text('إعادة المحاولة'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightPrimary,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        /// Success state
        if (state is HomeSuccess) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header (Avatar + Name + Icons)
                const HomeHeader(),

                SizedBox(height: 18.h),

                /// Tip of the Day
                const TipOfTheDayCard(),

                SizedBox(height: 18.h),

                /// Services / Locations Switch
                ServicesLocationsSwitch(
                  isServicesSelected: true,
                  onChanged: (value) {
                    // TODO: implement locations view
                  },
                ),

                SizedBox(height: 18.h),

                /// Category Filter Chips
                CategoryList(
                  categories: state.categories,
                  selectedCategoryId: state.selectedCategoryId,
                  onCategorySelected: (categoryId) {
                    cubit.selectCategory(categoryId);
                  },
                ),

                SizedBox(height: 18.h),

                /// Services Grid
                ServicesGrid(
                  services: state.services,
                ),

                SizedBox(height: 16.h),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
