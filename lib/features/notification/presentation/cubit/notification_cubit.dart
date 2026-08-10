import 'package:awraq/core/services/firebase_notification_service.dart';
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

  // ============================================================
  // GETTERS
  // ============================================================

  int get unreadCount {
    return notifications.where((notification) => !notification.isRead).length;
  }

  bool get hasNotifications {
    return notifications.isNotEmpty;
  }

  bool get hasUnreadNotifications {
    return notifications.any(
      (notification) => !notification.isRead,
    );
  }

  // ============================================================
  // GET NOTIFICATIONS
  // ============================================================

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

  // ============================================================
  // MARK ONE AS READ
  // ============================================================

  Future<void> markAsRead(int notificationId) async {
    try {
      // Backend request
      await repo.markAsRead(notificationId);

      // Update local list
      final index = notifications.indexWhere(
        (notification) => notification.id == notificationId,
      );

      if (index == -1) {
        return;
      }

       final oldNotification = notifications[index];

      notifications[index] = NotificationModel(
        id: oldNotification.id,
        userId: oldNotification.userId,
        type: oldNotification.type,
        title: oldNotification.title,
        message: oldNotification.message,
        isRead: true,
      );

      // Rebuild UI
      emit(NotificationSuccess());
    } catch (e) {
      emit(
        NotificationFailure(
          e.toString(),
        ),
      );
    }
  }

  // ============================================================
  // MARK ALL AS READ
  // ============================================================

  Future<void> markAllAsRead() async {
    try {
      // Backend request
      await repo.markAllAsRead();

      // Update local list
      notifications = notifications.map((notification) {
        return NotificationModel(
          id: notification.id,
          userId: notification.userId,
          type: notification.type,
          title: notification.title,
          message: notification.message,
          isRead: true,
        );
      }).toList();

      // Rebuild UI
      emit(NotificationSuccess());
    } catch (e) {
      emit(
        NotificationFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> registerFcmToken() async {
    try {
      final token = await FirebaseNotificationService.instance.getFcmToken();

      if (token == null || token.isEmpty) {
        print('FCM Token is null or empty');
        return;
      }

      await repo.registerFcmToken(token);

      print('FCM Token sent to backend successfully');
    } catch (e) {
      print('Failed to send FCM Token to backend: $e');
    }
  }
}
