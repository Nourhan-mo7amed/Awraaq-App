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
import 'package:awraq/features/auth/presentation/view/login_view.dart';
import 'package:awraq/features/auth/presentation/view/signup_view.dart';
import 'package:awraq/features/layout/presentation/views/bottom_nav_view.dart';
import 'package:awraq/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:awraq/features/location_details/presentation/views/location_details_view.dart';
import 'package:awraq/features/location_details/data/models/location_details_model.dart';
import 'package:hugeicons/hugeicons.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      // 1. الشاشات العادية (بدون Bottom Navigation Bar)
      // انا يوسف عامل هنا كومنت عشان لسه مفيش SplashScreen
      // GoRoute(
      //   path: AppRoutes.kSplash,
      //   builder: (context, state) => const SplashView(),
      // ),
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
      GoRoute(
        path: AppRoutes.locationDetails,
        builder: (context, state) {
          final location = state.extra is LocationDetailsModel
              ? state.extra as LocationDetailsModel
              : null;
          return LocationDetailsView(location: location);
        },
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                context.push(AppRoutes.locationDetails);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1177FF),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedLocation01,
                color: Colors.white,
                size: 20,
              ),
              label: const Text(
                'Open Location Details',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
