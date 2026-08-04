import 'package:awraq/features/notification_settings/presentation/views/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/notification_settings_cubit.dart';
import '../cubit/notification_settings_state.dart';

class NotificationSettingsView extends StatelessWidget {
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationSettingsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          centerTitle: true,
        ),
        body: BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
          builder: (context, state) {
            final cubit = context.read<NotificationSettingsCubit>();

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: cubit.settings.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, index) {
                    final item = cubit.settings[index];

                    return NotificationTile(
                      icon: item.icon,
                      iconColor: item.iconColor,
                      title: item.title,
                      subtitle: item.subtitle,
                      value: item.isEnabled,
                      onChanged: (value) {
                        cubit.toggleSetting(index, value);
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
