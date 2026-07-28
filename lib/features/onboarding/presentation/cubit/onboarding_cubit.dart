import 'package:awraq/features/onboarding/presentation/cubit/onboarding_states.dart';
import 'package:awraq/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController();

  int currentPage = 0;

  bool get isLastPage => currentPage == pages.length - 1;

  bool get isFirstPage => currentPage == 0;

  final List pages = [
    Assets.assetsImagesOnboarding1,
    Assets.assetsImagesOnboarding2,
    Assets.assetsImagesOnboarding3,
  ];

  void onPageChanged(int index) {
    currentPage = index;

    emit(OnboardingPageChanged(currentPage: index));
  }

  void nextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previusPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
