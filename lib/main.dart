import 'package:awraq/core/service_lacoator.dart';
import 'package:awraq/core/services/firebase_notification_service.dart';
import 'package:awraq/features/localization/presentation/cubit/language_cubit.dart';
import 'package:awraq/core/routing/app_router.dart';
import 'package:awraq/core/theme/app_dark_theme.dart';
import 'package:awraq/core/theme/app_light_theme.dart';
import 'package:awraq/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();

  print('Background notification received');
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Data: ${message.data}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await FirebaseNotificationService.instance.initialize();

  FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );

  await setupServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<LanguageCubit>(
          create: (_) => LanguageCubit(),
        ),
      ],
      child: const AwraqApp(),
    ),
  );
}

class AwraqApp extends StatelessWidget {
  const AwraqApp({super.key});

  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageCubit>().state;
    final theme = context.watch<ThemeCubit>().state;

    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        // Theme
        themeMode: theme.themeMode,
        theme: AppLightTheme.theme,
        darkTheme: AppDarkTheme.theme,

        // Localization
        locale: language.locale,
        title: 'Awraq',

        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        supportedLocales: S.delegate.supportedLocales,

        // Routing
        routerConfig: AppRouter.router,
      ),
    );
  }
}
// import 'package:awraq/core/service_lacoator.dart';
// import 'package:awraq/features/localization/presentation/cubit/language_cubit.dart';
// import 'package:awraq/core/routing/app_router.dart';
// import 'package:awraq/core/theme/app_dark_theme.dart';
// import 'package:awraq/core/theme/app_light_theme.dart';
// import 'package:awraq/features/settings/presentation/cubit/theme_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'generated/l10n.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await setupServiceLocator();
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => ThemeCubit()),
//         BlocProvider(create: (_) => LanguageCubit()),
//       ],
//       child: const AwraqApp(),
//     ),
//   );
// }

// class AwraqApp extends StatelessWidget {
//   const AwraqApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final language = context.watch<LanguageCubit>().state;
//     final theme = context.watch<ThemeCubit>().state;

//     return ScreenUtilInit(
//       designSize: const Size(440, 956),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       child: MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         themeMode: theme.themeMode,
//         theme: AppLightTheme.theme,
//         darkTheme: AppDarkTheme.theme,
//         locale: language.locale,
//         title: 'Awraq',
//         localizationsDelegates: [
//           S.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: S.delegate.supportedLocales,
//         routerConfig: AppRouter.router,
//       ),
//     );
//   }
// }
