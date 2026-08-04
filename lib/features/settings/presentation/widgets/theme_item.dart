import 'package:awraq/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeItem extends StatelessWidget {
  const ThemeItem({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.groupValue,
  });

  final String title;
  final IconData icon;
  final ThemeMode value;
  final ThemeMode groupValue;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<ThemeMode>(
      value: value,
      groupValue: groupValue,
      onChanged: (mode) {
        if (mode != null) {
          context.read<ThemeCubit>().changeTheme(mode);
        }
      },
      secondary: Icon(icon),
      title: Text(title),
    );
  }
}
