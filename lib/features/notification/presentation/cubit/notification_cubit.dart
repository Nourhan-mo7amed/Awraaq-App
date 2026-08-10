import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/notification_model.dart';
import '../../data/repo/notification_repo.dart';
import 'notification_states.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit({
    required this.repo,
  }) : super(NotificationInitial());

  final NotificationRepo repo;

  List<NotificationModel> notifications = [];

  // =========================
  // Getters
  // =========================

  int get unreadCount {
    return notifications
        .where((notification) => !notification.isRead)
        .length;
  }

  bool get hasNotifications {
    return notifications.isNotEmpty;
  }

  bool get hasUnreadNotifications {
    return notifications.any(
      (notification) => !notification.isRead,
    );
  }

  // =========================
  // Get Notifications
  // =========================

  Future<void> getNotifications() async {
    emit(NotificationLoading());

    try {
      notifications = await repo.getNotifications();

      emit(NotificationSuccess());
    } catch (e) {
      emit(
        NotificationFailure(
          e.toString(),
        ),
      );
    }
  }
}