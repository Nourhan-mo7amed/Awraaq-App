import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/core/service_lacoator.dart';
import 'package:awraq/features/auth/screen/forgot_password_screen.dart';
import 'package:awraq/features/auth/screen/login_screen.dart';
import 'package:awraq/features/auth/screen/otp_verification_screen.dart';
import 'package:awraq/features/auth/screen/register_screen.dart';
import 'package:awraq/features/auth/screen/reset_password_screen.dart';
import 'package:awraq/features/auth/screen/success_screen.dart';
import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:awraq/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:awraq/features/governates/data/repo/governorates_repo.dart';
import 'package:awraq/features/governates/presentation/cubit/governorates_cubit.dart';
import 'package:awraq/features/home/presentation/cubit/home_cubit.dart';
import 'package:awraq/features/home/presentation/view/home_view.dart';
import 'package:awraq/features/layout/cubit/layout_cubit/layout_cubit.dart';
import 'package:awraq/features/layout/presentation/views/bottom_nav_view.dart';
import 'package:awraq/features/localization/presentation/views/localization_view.dart';
import 'package:awraq/features/location_details/data/models/location_details_model.dart';
import 'package:awraq/features/location_details/presentation/views/location_details_view.dart';
import 'package:awraq/features/notification_settings/presentation/views/notification_settings_view.dart';
import 'package:awraq/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:awraq/features/profile/data/repo/profile_repository.dart';
import 'package:awraq/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:awraq/features/profile/presentation/views/profile_view.dart';
import 'package:awraq/features/settings/presentation/views/theme_view.dart';
import 'package:awraq/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

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
        builder: (context, state) => const LoginScreen(),
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
        path: AppRoutes.locationDetails,
        builder: (context, state) {
          final location = state.extra is LocationDetailsModel
              ? state.extra as LocationDetailsModel
              : null;

          return LocationDetailsView(location: location);
        },
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

      // Home
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<HomeCubit>()..getHomeData(),
          child: const HomeView(),
        ),
      ),

      // Edit Profile
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

      // Profile
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => BlocProvider(
          create: (_) => ProfileCubit(
            repo: getIt<ProfileRepo>(),
          )..getProfile(),
          child: const ProfileView(),
        ),
      ),

      // Layout + Home Cubit
      GoRoute(
        path: AppRoutes.layout,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => LayoutCubit(),
            ),
            BlocProvider(
              create: (_) => getIt<HomeCubit>()..getHomeData(),
            ),
          ],
          child: const LayoutView(),
        ),
      ),
    ],
  );
}

class DummyScreen extends StatelessWidget {
  final String title;

  const DummyScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                context.push(AppRoutes.locationDetails);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1177FF),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}