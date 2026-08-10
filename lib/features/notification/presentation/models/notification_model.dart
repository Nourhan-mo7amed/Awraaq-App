class NotificationModel {
  final String title;
  final String description;
  final String time;
  final String icon;
  final bool isRead;

  const NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.isRead,
  });
}