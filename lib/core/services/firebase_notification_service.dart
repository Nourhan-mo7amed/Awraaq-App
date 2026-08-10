import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationService {
  FirebaseNotificationService._();

  static final FirebaseNotificationService instance =
      FirebaseNotificationService._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel =
      AndroidNotificationChannel(
    'awraq_notifications',
    'Awraq Notifications',
    description: 'Notifications for Awraq app',
    importance: Importance.high,
  );

  // ============================================================
  // INITIALIZE
  // ============================================================

  Future<void> initialize() async {
    await _requestPermission();

    await _initializeLocalNotifications();

    await _createNotificationChannel();

    await getFcmToken();

    _listenToForegroundMessages();

    _listenToNotificationTap();

    await _handleTerminatedApp();
  }

  // ============================================================
  // PERMISSION
  // ============================================================

  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    print(
      'Notification permission: ${settings.authorizationStatus}',
    );
  }

  // ============================================================
  // LOCAL NOTIFICATIONS INITIALIZATION
  // ============================================================

  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
    );

    await _localNotifications.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final payload = response.payload;

        if (payload == null || payload.isEmpty) {
          return;
        }

        try {
          final decodedData = jsonDecode(payload);

          final data = Map<String, dynamic>.from(
            decodedData as Map,
          );

          _handleNotificationNavigation(data);
        } catch (e) {
          print(
            'Notification payload error: $e',
          );
        }
      },
    );
  }

  // ============================================================
  // NOTIFICATION CHANNEL
  // ============================================================

  Future<void> _createNotificationChannel() async {
    final androidPlugin =
        _localNotifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    await androidPlugin?.createNotificationChannel(
      _channel,
    );
  }

  // ============================================================
  // FCM TOKEN
  // ============================================================

  Future<String?> getFcmToken() async {
  try {
    final token = await _messaging.getToken();

    print('================================');
    print('FCM TOKEN => $token');
    print('================================');

    return token;
  } catch (e) {
    print('Failed to get FCM Token: $e');
    return null;
  }
}

  // ============================================================
  // FOREGROUND
  // ============================================================

  void _listenToForegroundMessages() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        print('================================');
        print('Foreground notification received');
        print('Title: ${message.notification?.title}');
        print('Body: ${message.notification?.body}');
        print('Data: ${message.data}');
        print('================================');

        await _showLocalNotification(message);
      },
    );
  }

  // ============================================================
  // SHOW LOCAL NOTIFICATION
  // ============================================================

  Future<void> _showLocalNotification(
    RemoteMessage message,
  ) async {
    final notification = message.notification;

    if (notification == null) {
      return;
    }

    const androidDetails = AndroidNotificationDetails(
      'awraq_notifications',
      'Awraq Notifications',
      channelDescription: 'Notifications for Awraq app',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      id: message.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: notificationDetails,
      payload: jsonEncode(message.data),
    );
  }

  // ============================================================
  // BACKGROUND - NOTIFICATION TAP
  // ============================================================

  void _listenToNotificationTap() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        print('================================');
        print('Notification tapped from background');
        print('Data: ${message.data}');
        print('================================');

        _handleNotificationNavigation(
          message.data,
        );
      },
    );
  }

  // ============================================================
  // TERMINATED
  // ============================================================

  Future<void> _handleTerminatedApp() async {
    final message = await _messaging.getInitialMessage();

    if (message == null) {
      return;
    }

    print('================================');
    print('App opened from terminated notification');
    print('Data: ${message.data}');
    print('================================');

    _handleNotificationNavigation(
      message.data,
    );
  }

  // ============================================================
  // NAVIGATION
  // ============================================================

  void _handleNotificationNavigation(
    Map<String, dynamic> data,
  ) {
    print(
      'Notification navigation data: $data',
    );

    // هنربط GoRouter هنا بعدين.
  }
}
// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class FirebaseNotificationService {
//   FirebaseNotificationService._();

//   static final FirebaseNotificationService instance =
//       FirebaseNotificationService._();

//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;

//   final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();

//   static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
//     'awraq_notifications',
//     'Awraq Notifications',
//     description: 'Notifications for Awraq app',
//     importance: Importance.high,
//   );

//   // ============================================================
//   // INITIALIZE
//   // ============================================================

//   Future<void> initialize() async {
//     await _requestPermission();

//     await _initializeLocalNotifications();

//     await _createNotificationChannel();

//     await _getFcmToken();

//     _listenToForegroundMessages();

//     _listenToNotificationTap();

//     await _handleTerminatedApp();
//   }

//   // ============================================================
//   // PERMISSION
//   // ============================================================

//   Future<void> _requestPermission() async {
//     final settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//       provisional: false,
//     );

//     print(
//       'Notification permission: ${settings.authorizationStatus}',
//     );
//   }

//   // ============================================================
//   // LOCAL NOTIFICATIONS INITIALIZATION
//   // ============================================================

//   Future<void> _initializeLocalNotifications() async {
//     const androidSettings = AndroidInitializationSettings(
//       '@mipmap/ic_launcher',
//     );

//     const initializationSettings = InitializationSettings(
//       android: androidSettings,
//     );

//     Future<void> _initializeLocalNotifications() async {
//       const androidSettings = AndroidInitializationSettings(
//         '@mipmap/ic_launcher',
//       );

//       const initializationSettings = InitializationSettings(
//         android: androidSettings,
//       );

//       await _localNotifications.initialize(
//         settings: initializationSettings,
//         onDidReceiveNotificationResponse: (response) {
//           final payload = response.payload;

//           if (payload == null || payload.isEmpty) {
//             return;
//           }

//           try {
//             final data = jsonDecode(payload);

//             _handleNotificationNavigation(
//               Map<String, dynamic>.from(data),
//             );
//           } catch (e) {
//             print('Notification payload error: $e');
//           }
//         },
//       );
//     }
//   }

//   // ============================================================
//   // NOTIFICATION CHANNEL
//   // ============================================================

//   Future<void> _createNotificationChannel() async {
//     final androidPlugin =
//         _localNotifications.resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>();

//     await androidPlugin?.createNotificationChannel(
//       _channel,
//     );
//   }

//   // ============================================================
//   // FCM TOKEN
//   // ============================================================

//   Future<String?> _getFcmToken() async {
//     final token = await _messaging.getToken();

//     print('================================');
//     print('FCM TOKEN => $token');
//     print('================================');

//     return token;
//   }

//   // ============================================================
//   // FOREGROUND
//   // ============================================================

//   void _listenToForegroundMessages() {
//     FirebaseMessaging.onMessage.listen(
//       (RemoteMessage message) async {
//         print('================================');
//         print('Foreground notification received');
//         print('Title: ${message.notification?.title}');
//         print('Body: ${message.notification?.body}');
//         print('Data: ${message.data}');
//         print('================================');

//         await _showLocalNotification(message);
//       },
//     );
//   }

//   // ============================================================
//   // SHOW LOCAL NOTIFICATION
//   // ============================================================

//   Future<void> _showLocalNotification(
//     RemoteMessage message,
//   ) async {
//     final notification = message.notification;

//     if (notification == null) {
//       return;
//     }

//     const androidDetails = AndroidNotificationDetails(
//       'awraq_notifications',
//       'Awraq Notifications',
//       channelDescription: 'Notifications for Awraq app',
//       importance: Importance.high,
//       priority: Priority.high,
//       icon: '@mipmap/ic_launcher',
//     );

//     const notificationDetails = NotificationDetails(
//       android: androidDetails,
//     );

//     await _localNotifications.show(
//       id: notification.hashCode,
//       title: notification.title,
//       body: notification.body,
//       notificationDetails: notificationDetails,
//       payload: jsonEncode(message.data),
//     );
//   }

//   // ============================================================
//   // BACKGROUND
//   // ============================================================

//   void _listenToNotificationTap() {
//     FirebaseMessaging.onMessageOpenedApp.listen(
//       (RemoteMessage message) {
//         print('================================');
//         print('Notification tapped from background');
//         print('Data: ${message.data}');
//         print('================================');

//         _handleNotificationNavigation(
//           message.data,
//         );
//       },
//     );
//   }

//   // ============================================================
//   // TERMINATED
//   // ============================================================

//   Future<void> _handleTerminatedApp() async {
//     final message = await _messaging.getInitialMessage();

//     if (message == null) {
//       return;
//     }

//     print('================================');
//     print('App opened from terminated notification');
//     print('Data: ${message.data}');
//     print('================================');

//     _handleNotificationNavigation(
//       message.data,
//     );
//   }

//   // ============================================================
//   // NAVIGATION
//   // ============================================================

//   void _handleNotificationNavigation(
//     Map<String, dynamic> data,
//   ) {
//     print(
//       'Notification navigation data: $data',
//     );

//     // هنضيف GoRouter هنا بعدين.
//   }
// }
