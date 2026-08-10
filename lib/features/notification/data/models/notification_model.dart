class NotificationModel {
  final int id;
  final int userId;
  final String type;
  final String title;
  final String message;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      isRead: json['is_read'] as bool? ?? false,
    );
  }
}
// class NotificationModel {
//   final int id;
//   final int userId;
//   final String type;
//   final String title;
//   final String message;
//   final bool isRead;

//   NotificationModel({
//     required this.id,
//     required this.userId,
//     required this.type,
//     required this.title,
//     required this.message,
//     required this.isRead,
//   });

//   factory NotificationModel.fromJson(Map<String, dynamic> json) {
//     return NotificationModel(
//       id: json['id'] as int,
//       userId: json['user_id'] as int,
//       type: json['type'] as String? ?? '',
//       title: json['title'] as String? ?? '',
//       message: json['message'] as String? ?? '',
//       isRead: json['is_read'] as bool? ?? false,
//     );
//   }
// }
// // class NotificationModel {
// //   final String title;
// //   final String description;
// //   final String time;
// //   final String icon;
// //   final bool isRead;

// //   const NotificationModel({
// //     required this.title,
// //     required this.description,
// //     required this.time,
// //     required this.icon,
// //     required this.isRead,
// //   });
// // }