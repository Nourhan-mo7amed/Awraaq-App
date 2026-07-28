abstract class OnboardingStates {}

 class OnboardingInitial extends OnboardingStates {}

class OnboardingPageChanged extends OnboardingStates {
  int currentPage ;
  OnboardingPageChanged({required this.currentPage});
}
