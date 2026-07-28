import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/core/widgets/custom_button.dart';
import 'package:awraq/core/widgets/custom_text_widget.dart';
import 'package:awraq/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:awraq/features/onboarding/presentation/cubit/onboarding_states.dart';
import 'package:awraq/features/onboarding/presentation/widgets/onboarding_dot_indicator.dart';
import 'package:awraq/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:awraq/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingStates>(
            builder: (context, state) {
              final cubit = context.read<OnboardingCubit>();
              // final page = cubit.pages[cubit.currentPage];
              final s = S.of(context);

              final titles = [
                s.onboardingTitle1,
                s.onboardingTitle2,
                s.onboardingTitle3,
              ];

              final descriptions = [
                s.onboardingDescription1,
                s.onboardingDescription2,
                s.onboardingDescription3,
              ];

              return Stack(
                children: [
                  PageView.builder(
                    controller: cubit.pageController,
                    itemCount: cubit.pages.length,
                    onPageChanged: cubit.onPageChanged,
                    itemBuilder: (_, index) {
                      return OnboardingPage(image: cubit.pages[index]);
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 369.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 20.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: titles[cubit.currentPage],
                            textAlign: TextAlign.start,
                            style: AppTextStyles.bold28.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          CustomTextWidget(
                            text: descriptions[cubit.currentPage],
                            textAlign: TextAlign.start,
                            style: AppTextStyles.medium18.copyWith(
                              color: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.color,
                            ),
                          ),

                          const Spacer(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OnboardingDotIndicator(
                                currentPage: cubit.currentPage,
                                pagesCount: cubit.pages.length,
                              ),
                            ],
                          ),

                          SizedBox(height: 24.h),
                          CustomButton(
                            text: cubit.isLastPage
                                ? S.of(context).getStarted
                                : S.of(context).next,
                            onPressed: () {
                              if (cubit.isLastPage) {
                                context.go(AppRoutes.login);
                              } else {
                                cubit.nextPage();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
