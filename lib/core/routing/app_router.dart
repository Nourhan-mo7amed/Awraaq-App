import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/core/service_lacoator.dart';

// Auth
import 'package:awraq/features/auth/screen/forgot_password_screen.dart';
import 'package:awraq/features/auth/screen/login_screen.dart';
import 'package:awraq/features/auth/screen/otp_verification_screen.dart';
import 'package:awraq/features/auth/screen/register_screen.dart';
import 'package:awraq/features/auth/screen/reset_password_screen.dart';
import 'package:awraq/features/auth/screen/success_screen.dart';

// Edit Profile
import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:awraq/features/edit_profile/presentation/views/edit_profile_view.dart';

// Governorates
import 'package:awraq/features/governates/data/repo/governorates_repo.dart';
import 'package:awraq/features/governates/presentation/cubit/governorates_cubit.dart';

// Home
import 'package:awraq/features/home/presentation/cubit/home_cubit.dart';
import 'package:awraq/features/home/presentation/view/home_view.dart';

// Layout
import 'package:awraq/features/layout/cubit/layout_cubit/layout_cubit.dart';
import 'package:awraq/features/layout/presentation/views/bottom_nav_view.dart';

// Localization
import 'package:awraq/features/localization/presentation/views/localization_view.dart';

// Location Details
import 'package:awraq/features/location_details/data/models/location_details_model.dart';
import 'package:awraq/features/location_details/presentation/views/location_details_view.dart';

// Notification
import 'package:awraq/features/notification/presentation/views/notification_screen.dart';

// Notification Settings
import 'package:awraq/features/notification_settings/presentation/views/notification_settings_view.dart';

// Onboarding
import 'package:awraq/features/onboarding/presentation/views/onboarding_view.dart';

// Procedure Details
import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';
import 'package:awraq/features/procedure_details/presentation/views/procedure_details_view.dart';

// Profile
import 'package:awraq/features/profile/data/repo/profile_repository.dart';
import 'package:awraq/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:awraq/features/profile/presentation/views/profile_view.dart';

// Saved
import 'package:awraq/features/saved/presentation/views/saved_services_view.dart';

// Search
import 'package:awraq/features/search/presentation/views/search_view.dart';

// Settings
import 'package:awraq/features/settings/presentation/views/theme_view.dart';

// Splash
import 'package:awraq/features/splash/presentation/view/splash_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      // Splash
      GoRoute(
        path: AppRoutes.kSplash,
        builder: (context, state) => const SplashView(),
      ),

      // Onboarding
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),

      // Auth
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

      // Settings
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

      // Location Details
      GoRoute(
        path: AppRoutes.locationDetails,
        builder: (context, state) {
          final location = state.extra is LocationDetailsModel
              ? state.extra as LocationDetailsModel
              : null;

          return LocationDetailsView(
            location: location,
          );
        },
      ),

      // Procedure Details
      GoRoute(
        path: AppRoutes.procedureDetails,
        builder: (context, state) {
          final procedure = state.extra is ProcedureDetailsModel
              ? state.extra as ProcedureDetailsModel
              : null;

          return ProcedureDetailsView(
            procedure: procedure,
          );
        },
      ),

      // Notification
      GoRoute(
        path: AppRoutes.notification,
        builder: (context, state) => const NotificationScreen(),
      ),

      // Bottom Navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return LayoutView(
           
          );
        },
        branches: [
          // Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),

          // Search
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.search,
                builder: (context, state) => const SearchView(),
              ),
            ],
          ),

          // Saved
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.saved,
                builder: (context, state) => const SavedServicesView(),
              ),
            ],
          ),

          // AI Chat
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: AppRoutes.aiChat,
          //       builder: (context, state) =>
          //           const DummyScreen(title: 'AI Chat'),
          //     ),
          //   ],
          // ),
        ],
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

      // Layout
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

// class DummyScreen extends StatelessWidget {
//   final String title;

//   const DummyScreen({
//     super.key,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Location Details
//             ElevatedButton.icon(
//               onPressed: () {
//                 context.push(AppRoutes.locationDetails);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF1177FF),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 12,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               icon: const HugeIcon(
//                 icon: HugeIcons.strokeRoundedLocation01,
//                 color: Colors.white,
//                 size: 20,
//               ),
//               label: const Text(
//                 'Open Location Details',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 12),

//             // Procedure Details
//             ElevatedButton.icon(
//               onPressed: () {
//                 context.push(AppRoutes.procedureDetails);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF1177FF),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 12,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               icon: const HugeIcon(
//                 icon: HugeIcons.strokeRoundedFile02,
//                 color: Colors.white,
//                 size: 20,
//               ),
//               label: const Text(
//                 'Open Procedure Details',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}
// import 'package:awraq/core/routing/app_routes.dart';
// import 'package:awraq/core/service_lacoator.dart';
// import 'package:awraq/features/auth/screen/forgot_password_screen.dart';
// import 'package:awraq/features/auth/screen/login_screen.dart';
// import 'package:awraq/features/auth/screen/otp_verification_screen.dart';
// import 'package:awraq/features/auth/screen/register_screen.dart';
// import 'package:awraq/features/auth/screen/reset_password_screen.dart';
// import 'package:awraq/features/auth/screen/success_screen.dart';
// import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
// import 'package:awraq/features/edit_profile/presentation/views/edit_profile_view.dart';
// import 'package:awraq/features/governates/data/repo/governorates_repo.dart';
// import 'package:awraq/features/governates/presentation/cubit/governorates_cubit.dart';
// import 'package:awraq/features/home/presentation/cubit/home_cubit.dart';
// import 'package:awraq/features/home/presentation/view/home_view.dart';
// import 'package:awraq/features/layout/cubit/layout_cubit/layout_cubit.dart';
// import 'package:awraq/features/layout/presentation/views/bottom_nav_view.dart';
// import 'package:awraq/features/localization/presentation/views/localization_view.dart';
// import 'package:awraq/features/location_details/data/models/location_details_model.dart';
// import 'package:awraq/features/location_details/presentation/views/location_details_view.dart';
// import 'package:awraq/features/notification_settings/presentation/views/notification_settings_view.dart';
// import 'package:awraq/features/onboarding/presentation/views/onboarding_view.dart';
// import 'package:awraq/features/profile/data/repo/profile_repository.dart';
// import 'package:awraq/features/profile/presentation/cubit/profile_cubit.dart';
// import 'package:awraq/features/profile/presentation/views/profile_view.dart';
// import 'package:awraq/features/settings/presentation/views/theme_view.dart';
// import 'package:awraq/features/splash/presentation/view/splash_view.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// <<<<<<< HEAD
// =======

// import 'package:awraq/core/routing/app_routes.dart';
// import 'package:awraq/features/auth/presentation/view/login_view.dart';
// import 'package:awraq/features/auth/presentation/view/signup_view.dart';
// import 'package:awraq/features/layout/presentation/views/bottom_nav_view.dart';
// import 'package:awraq/features/onboarding/presentation/views/onboarding_view.dart';
// import 'package:awraq/features/location_details/presentation/views/location_details_view.dart';
// import 'package:awraq/features/location_details/data/models/location_details_model.dart';
// import 'package:awraq/features/procedure_details/presentation/views/procedure_details_view.dart';
// import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';
// import 'package:awraq/features/saved/presentation/views/saved_services_view.dart';
// >>>>>>> feature/procedure_details
// import 'package:hugeicons/hugeicons.dart';

// abstract class AppRouter {
//   static final router = GoRouter(
//     initialLocation: AppRoutes.home,
//     routes: [
// <<<<<<< HEAD
//       GoRoute(
//         path: AppRoutes.kSplash,
//         builder: (context, state) => const SplashView(),
//       ),

// =======
// >>>>>>> feature/procedure_details
//       GoRoute(
//         path: AppRoutes.onboarding,
//         builder: (context, state) => const OnboardingView(),
//       ),

//       GoRoute(
//         path: AppRoutes.login,
//         builder: (context, state) => const LoginScreen(),
//       ),

//       GoRoute(
//         path: AppRoutes.theme,
//         builder: (context, state) => const ThemeView(),
//       ),

//       GoRoute(
//         path: AppRoutes.language,
//         builder: (context, state) => const LanguageView(),
//       ),

//       GoRoute(
//         path: AppRoutes.notifications,
//         builder: (context, state) => const NotificationSettingsView(),
//       ),

//       GoRoute(
//         path: AppRoutes.locationDetails,
//         builder: (context, state) {
//           final location = state.extra is LocationDetailsModel
//               ? state.extra as LocationDetailsModel
//               : null;

//           return LocationDetailsView(location: location);
//         },
//       ),
//       GoRoute(
//         path: AppRoutes.procedureDetails,
//         builder: (context, state) {
//           final procedure = state.extra is ProcedureDetailsModel
//               ? state.extra as ProcedureDetailsModel
//               : null;
//           return ProcedureDetailsView(procedure: procedure);
//         },
//       ),

//       GoRoute(
//         path: AppRoutes.signUp,
//         builder: (context, state) => const RegisterScreen(),
//       ),

//       GoRoute(
//         path: AppRoutes.forgotPassword,
//         builder: (context, state) => const ForgotPasswordScreen(),
//       ),

//       GoRoute(
//         path: AppRoutes.otp,
//         builder: (context, state) => const OtpScreen(),
//       ),

//       GoRoute(
//         path: AppRoutes.resetPassword,
//         builder: (context, state) => const ResetPasswordScreen(),
//       ),

//       GoRoute(
//         path: AppRoutes.success,
//         builder: (context, state) => const SuccessScreen(),
//       ),

//       // Home
//       GoRoute(
//         path: AppRoutes.notification,
//         builder: (context, state) => const NotificationScreen(),
//       ),

//       // 2. الشاشات التي تحتوي على Bottom Navigation Bar
//       StatefulShellRoute.indexedStack(
//         builder: (context, state, navigationShell) {
//           return LayoutView(navigationShell: navigationShell);
//         },
//         branches: [
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: AppRoutes.home,
//                 builder: (context, state) => const HomeScreen(),
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: AppRoutes.search,
//                 builder: (context, state) => const SearchView(),
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: AppRoutes.saved,
//                 builder: (context, state) => const DummyScreen(title: 'Saved'),
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: AppRoutes.aiChat,
//                 builder: (context, state) =>
//                     const DummyScreen(title: 'AI Chat'),
//               ),
//             ],
//           ),
//         ],
//         path: AppRoutes.home,
//         builder: (context, state) => BlocProvider(
//           create: (_) => getIt<HomeCubit>()..getHomeData(),
//           child: const HomeView(),
//         ),
//       ),

//       // Edit Profile
//       GoRoute(
//         path: AppRoutes.editProfile,
//         builder: (context, state) => MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (_) => GovernoratesCubit(
//                 repo: getIt<GovernoratesRepo>(),
//               )..getGovernorates(),
//             ),
//             BlocProvider(
//               create: (_) => EditProfileCubit(
//                 repo: getIt<ProfileRepo>(),
//               )..getProfile(),
//             ),
//           ],
//           child: const EditProfileView(),
//         ),
//       ),

//       // Profile
//       GoRoute(
//         path: AppRoutes.profile,
//         builder: (context, state) => BlocProvider(
//           create: (_) => ProfileCubit(
//             repo: getIt<ProfileRepo>(),
//           )..getProfile(),
//           child: const ProfileView(),
//         ),
//       ),

//       // Layout + Home Cubit
//       GoRoute(
//         path: AppRoutes.layout,
//         builder: (context, state) => MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (_) => LayoutCubit(),
//             ),
//             BlocProvider(
//               create: (_) => getIt<HomeCubit>()..getHomeData(),
//             ),
//           ],
//           child: const LayoutView(),
//         ),
//       ),
//     ],
//   );
// }

// class DummyScreen extends StatelessWidget {
//   final String title;

//   const DummyScreen({
//     super.key,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: () {
//                 context.push(AppRoutes.locationDetails);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF1177FF),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 12,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               icon: const HugeIcon(
//                 icon: HugeIcons.strokeRoundedLocation01,
//                 color: Colors.white,
//                 size: 20,
//               ),
//               label: const Text(
//                 'Open Location Details',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             ElevatedButton.icon(
//               onPressed: () {
//                 context.push(AppRoutes.procedureDetails);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF1177FF),
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               icon: const HugeIcon(
//                 icon: HugeIcons.strokeRoundedFile02,
//                 color: Colors.white,
//                 size: 20,
//               ),
//               label: const Text(
//                 'Open Procedure Details',
//                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }