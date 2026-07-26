// import 'package:awraq/core/routing/app_routes.dart';
// import 'package:awraq/features/auth/presentation/view/login_view.dart';
// import 'package:awraq/features/auth/presentation/view/signup_view.dart';
// import 'package:awraq/features/onboarding/presentation/view/onboarding_view.dart';
// import 'package:awraq/features/splash/presentation/view/splash_view.dart';
// import 'package:go_router/go_router.dart';

// abstract class AppRouter {
//   static final router = GoRouter(
//     routes: [
//       GoRoute(
//         path: AppRoutes.kSplash,
//         builder: (context, state) => const SplashView(),
//       ),
//       GoRoute(
//         path: AppRoutes.onboarding,
//         builder: (context, state) => const OnboardingView(),
//       ),

//       GoRoute(path: AppRoutes.login, builder: (context, state) => LoginView()),

//       GoRoute(
//         path: AppRoutes.signUp,

//         builder: (context, state) => const SignUpView(),
//       ),

//       // GoRoute(
//       //   path: AppRoutes.forgotPassword,
//       //   builder: (context, state) => const ForgotPasswordView(),
//       // ),

//       // GoRoute(
//       //   path: AppRoutes.getstarted,
//       //   builder: (context, state) => const GetStartedView(),
//       // ),

//       // GoRoute(
//       //   path: AppRoutes.layout,
//       //   builder: (context, state) => const LayoutView(),
//       // ),
//       // GoRoute(
//       //   path: AppRoutes.home,
//       //   builder: (context, state) => const HomeView(),
//       // ),
//     ],
//   );
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/features/splash/presentation/view/splash_view.dart';
import 'package:awraq/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:awraq/features/auth/presentation/view/login_view.dart';
import 'package:awraq/features/auth/presentation/view/signup_view.dart';

import '../../features/layout/presentation/views/bottom_nav_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.home,
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
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const SignUpView(),
      ),

      // 2. الـ Layout الخاص بالـ Bottom Navigation Bar (يحافظ على حالة التابات)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return LayoutView(navigationShell: navigationShell);
        },
        branches: [
          // تابة Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) =>
                    const DummyScreen(title: 'Home View'),
              ),
            ],
          ),
          // تابة Search
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.search,
                builder: (context, state) =>
                    const DummyScreen(title: 'Search View'),
              ),
            ],
          ),
          // تابة Saved
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.saved,
                builder: (context, state) =>
                    const DummyScreen(title: 'Saved View'),
              ),
            ],
          ),
          // تابة AI Chat
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.aiChat,
                builder: (context, state) =>
                    const DummyScreen(title: 'AI Chat View'),
              ),
            ],
          ),
        ],
      ),
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
