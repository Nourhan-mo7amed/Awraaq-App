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
      path: EndPoints.notifications, data: null,
    );

    final List data = response['data'] ?? [];

    return data
        .map(
          (item) => NotificationModel.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}