import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/features/auth/screen/login_screen.dart';
import 'package:awraq/features/auth/screen/register_screen.dart';
import 'package:awraq/features/auth/screen/forgot_password_screen.dart';
import 'package:awraq/features/auth/screen/otp_verification_screen.dart';
import 'package:awraq/features/auth/screen/reset_password_screen.dart';
import 'package:awraq/features/auth/screen/success_screen.dart';
import 'package:awraq/features/home/presentation/home_screen.dart';
import 'package:awraq/features/splash/presentation/view/splash_view.dart';

import '../../features/notification/presentation/views/notification_screen.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.notifications,
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

      GoRoute(
        path: AppRoutes.notification,
        builder: (context, state) => const NotificationScreen(),
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
