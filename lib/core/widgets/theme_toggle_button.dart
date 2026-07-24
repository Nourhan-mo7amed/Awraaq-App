import 'package:awraq/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        context.watch<ThemeCubit>().isDark
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
      onPressed: () {
        context.read<ThemeCubit>().toggleTheme();
      },
    );
  }
}