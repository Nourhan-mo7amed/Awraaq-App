import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/notification_model.dart';
import 'notification_settings_state.dart';

class NotificationSettingsCubit
    extends Cubit<NotificationSettingsState> {
  NotificationSettingsCubit()
      : super(NotificationSettingsInitial());

  final List<NotificationModel> settings = [

    NotificationModel(
      icon: Icons.auto_awesome,
      iconColor: Colors.orange,
      title: "New Procedures",
      subtitle: "Get notified whenever new procedures are added.",
      isEnabled: true,
    ),

    NotificationModel(
      icon: Icons.sync,
      iconColor: Colors.blue,
      title: "Procedure Updates",
      subtitle: "Get notified about procedure updates.",
      isEnabled: true,
    ),

    NotificationModel(
      icon: Icons.access_time,
      iconColor: Colors.orange,
      title: "Saved Procedure Reminder",
      subtitle: "Receive reminders about your saved procedure.",
      isEnabled: true,
    ),

    NotificationModel(
      icon: Icons.system_update_alt,
      iconColor: Colors.green,
      title: "App Updates",
      subtitle: "Get notified when a new app update is available.",
      isEnabled: true,
    ),

    NotificationModel(
      icon: Icons.location_on,
      iconColor: Colors.blue,
      title: "Location Follow-up",
      subtitle: "Get asked about places you've searched for.",
      isEnabled: true,
    ),
  ];

  void toggleSetting(int index, bool value) {
    settings[index].isEnabled = value;
    emit(NotificationSettingsUpdated());
  }
}