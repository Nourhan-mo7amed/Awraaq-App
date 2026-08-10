import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/end_points.dart';

import '../models/notification_model.dart';
import '../repo/notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final ApiConsumer api;

  NotificationRepoImpl({
    required this.api,
  });

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final response = await api.get(
      path: EndPoints.notifications,
      data: null,
    );

    final List<dynamic> data = response['data'] ?? [];

    return data
        .map(
          (item) => NotificationModel.fromJson(
            Map<String, dynamic>.from(item),
          ),
        )
        .toList();
  }

  @override
  Future<void> registerFcmToken(String fcmToken) async {
    await api.post(
      path: EndPoints.deviceTokens,
      data: {
        'fcm_token': fcmToken,
      },
    );
  }

  @override
  Future<void> markAsRead(int notificationId) async {
    await api.patch(
      path: '${EndPoints.notifications}/$notificationId/read',
      data: null,
    );
  }

  @override
  Future<void> markAllAsRead() async {
    await api.patch(
      path: '${EndPoints.notifications}/read-all',
      data: null,
    );
  }
}