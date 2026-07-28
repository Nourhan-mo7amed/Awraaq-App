import 'package:awraq/core/localization/language_cubit.dart';
import 'package:awraq/core/routing/app_router.dart';
import 'package:awraq/core/theme/app_dark_theme.dart';
import 'package:awraq/core/theme/app_light_theme.dart';
import 'package:awraq/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'generated/l10n.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
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
        themeMode: theme.themeMode,
        theme: AppLightTheme.theme,
        darkTheme: AppDarkTheme.theme,
        locale: language.locale,
        title: 'Awraq',
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
