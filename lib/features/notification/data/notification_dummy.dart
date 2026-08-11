import '../presentation/models/notification_model.dart';
import '../../../../core/constants/app_texts/notification_texts.dart';

// const List<NotificationModel> notificationDummy = [];
const List<NotificationModel> notificationDummy = [
  NotificationModel(
    title: NotificationTexts.requiredDocumentsTitle,
    description: NotificationTexts.requiredDocumentsDescription,
    time: "12/5/2026",
    icon: "assets/icons/document.png",
    isRead: false,
  ),
  NotificationModel(
    title: NotificationTexts.savedServiceTitle,
    description: NotificationTexts.savedServiceDescription,
    time: "2h ago",
    icon: "assets/icons/clock.png",
    isRead: true,
  ),
  NotificationModel(
    title: NotificationTexts.visitedPlaceTitle,
    description: NotificationTexts.visitedPlaceDescription,
    time: "1d ago",
    icon: "assets/icons/location.png",
    isRead: true,
  ),
];
