import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/features/auth/presentation/view/login_view.dart';
import 'package:awraq/features/auth/presentation/view/signup_view.dart';
import 'package:awraq/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:awraq/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.kSplash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),

      GoRoute(path: AppRoutes.login, builder: (context, state) => LoginView()),

      GoRoute(
        path: AppRoutes.signUp,

        builder: (context, state) => const SignUpView(),
      ),

      // GoRoute(
      //   path: AppRoutes.forgotPassword,
      //   builder: (context, state) => const ForgotPasswordView(),
      // ),

      // GoRoute(
      //   path: AppRoutes.getstarted,
      //   builder: (context, state) => const GetStartedView(),
      // ),

      // GoRoute(
      //   path: AppRoutes.layout,
      //   builder: (context, state) => const LayoutView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.home,
      //   builder: (context, state) => const HomeView(),
      // ),
    ],
  );
}
