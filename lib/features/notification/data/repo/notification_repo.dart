// 
import '../models/notification_model.dart';

abstract class NotificationRepo {
  Future<List<NotificationModel>> getNotifications();
}