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
import 'package:awraq/features/splash/presentation/view/splash_view.dart';
import 'package:awraq/features/auth/presentation/view/login_view.dart';
import 'package:awraq/features/auth/presentation/view/signup_view.dart';

import '../../features/layout/presentation/views/bottom_nav_view.dart';
import 'package:awraq/features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.profile,
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
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => BlocProvider(
          create: (_) => ProfileCubit(
            repo: getIt<ProfileRepo>(),
          )..getProfile(),
          child: const ProfileView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.theme,
        builder: (context, state) => const ThemeView(),
      ),
      GoRoute(
        path: AppRoutes.language,
        builder: (context, state) => const LanguageView(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationSettingsView(),
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => GovernoratesCubit(
                repo: getIt<GovernoratesRepo>(),
              )..getGovernorates(),
            ),
            BlocProvider(
              create: (_) => EditProfileCubit(
                repo: getIt<ProfileRepo>(),
              )..getProfile(),
            ),
          ],
          child: const EditProfileView(),
        ),
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
