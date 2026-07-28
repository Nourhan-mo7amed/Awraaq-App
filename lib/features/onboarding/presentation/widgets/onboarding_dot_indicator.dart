import 'package:awraq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingDotIndicator extends StatelessWidget {
  const OnboardingDotIndicator({
    super.key,
    required this.currentPage,
    required this.pagesCount,
  });

  final int currentPage;
  final int pagesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: index == currentPage ? 32.w : 12.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: index == currentPage
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ),
    );
  }
}
