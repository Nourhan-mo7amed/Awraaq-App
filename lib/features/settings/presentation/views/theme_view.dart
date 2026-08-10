import 'package:awraq/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:awraq/features/settings/presentation/cubit/theme_state.dart';
import 'package:awraq/features/settings/presentation/widgets/theme_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Light Mode"),
        centerTitle: true,
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ThemeItem(
                    title: "Light",
                    icon: Icons.light_mode_outlined,
                    value: ThemeMode.light,
                    groupValue: state.themeMode,
                  ),

                  const Divider(height: 1),

                  ThemeItem(
                    title: "Dark",
                    icon: Icons.dark_mode_outlined,
                    value: ThemeMode.dark,
                    groupValue: state.themeMode,
                  ),

                  const Divider(height: 1),

                  ThemeItem(
                    title: "System default",
                    icon: Icons.computer_outlined,
                    value: ThemeMode.system,
                    groupValue: state.themeMode,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}