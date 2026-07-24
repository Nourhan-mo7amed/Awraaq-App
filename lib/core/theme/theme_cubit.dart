import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ── State ──
class ThemeState {
  final ThemeMode themeMode;
  const ThemeState(this.themeMode);
}

// ── Cubit ──
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeMode.light));

  void toggleTheme() {
    if (state.themeMode == ThemeMode.light) {
      emit(const ThemeState(ThemeMode.dark));
    } else {
      emit(const ThemeState(ThemeMode.light));
    }
  }

  bool get isDark => state.themeMode == ThemeMode.dark;
}