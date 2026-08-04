import 'package:awraq/core/service_lacoator.dart';
import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:awraq/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:awraq/features/governates/data/repo/governorates_repo.dart';
import 'package:awraq/features/governates/presentation/cubit/governorates_cubit.dart';
import 'package:awraq/features/localization/presentation/views/localization_view.dart';
import 'package:awraq/features/notification_settings/presentation/views/notification_settings_view.dart';
import 'package:awraq/features/profile/data/repo/profile_repository.dart';
import 'package:awraq/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:awraq/features/profile/presentation/views/profile_view.dart';
import 'package:awraq/features/settings/presentation/views/theme_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/features/auth/screen/login_screen.dart';
import 'package:awraq/features/auth/screen/register_screen.dart';
import 'package:awraq/features/auth/screen/forgot_password_screen.dart';
import 'package:awraq/features/auth/screen/otp_verification_screen.dart';
import 'package:awraq/features/auth/screen/reset_password_screen.dart';
import 'package:awraq/features/auth/screen/success_screen.dart';
import 'package:awraq/features/home/presentation/home_screen.dart';
import 'package:awraq/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:awraq/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      // 1. الشاشات العادية (بدون Bottom Navigation Bar)
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
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: AppRoutes.signUp,

        builder: (context, state) => const RegisterScreen(),
      ),

      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      GoRoute(
        path: AppRoutes.otp,
        builder: (context, state) => const OtpScreen(),
      ),

      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),

      GoRoute(
        path: AppRoutes.success,
        builder: (context, state) => const SuccessScreen(),
      ),

      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),

      // GoRoute(
      //   path: AppRoutes.getstarted,
      //   builder: (context, state) => const GetStartedView(),
      // ),

      // GoRoute(
      //   path: AppRoutes.layout,
      //   builder: (context, state) => const LayoutView(),
      // ),
    ],
  );
}

class DummyScreen extends StatelessWidget {
  final String title;
  const DummyScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
