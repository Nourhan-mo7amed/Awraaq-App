import '../models/notification_model.dart';

abstract class NotificationRepo {
  Future<List<NotificationModel>> getNotifications();

  Future<void> registerFcmToken(String fcmToken);

  Future<void> markAsRead(int notificationId);

  Future<void> markAllAsRead();
}