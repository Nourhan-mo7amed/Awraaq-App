import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/features/auth/screen/login_screen.dart';
import 'package:awraq/features/auth/screen/register_screen.dart';
import 'package:awraq/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:awraq/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/screen/forgot_password_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.kSplash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),

      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        path: AppRoutes.signUp,

        builder: (context, state) => const RegisterScreen(),
      ),

      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

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
