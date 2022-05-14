import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  // final Future<FirebaseApp> firebaseInit = Firebase.initializeApp();

  NotificationSettings settings;

  firebaseInitialization() async {
    await Firebase.initializeApp();
    checkPermissionStatus();
  }

  checkPermissionStatus() async {
    settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('Permission status: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Authorized, initializing listeners');

      /// For iOS Foreground notification
      messaging.setForegroundNotificationPresentationOptions(
        badge: true,
        alert: true,
        sound: true,
      );

      /// Background
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      init();
      getToken();
    }
  }

  static Future getToken() async {
    String fcmToken = await messaging.getToken() ?? 'No FCM Token';
    print(fcmToken);
    return fcmToken;
  }

  Future<void> init() async {
    /// Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('Foreground (onMessage): Title:${message.notification.title}, Subtitle:${message.notification.body}, Data:${message.data.toString()}');
        // NavigationService.navigatorKey.currentContext.read(notificationListProvider).updateNotificationCount();
      }
    });

    /// Background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('onMessageOpenedApp: Title:${message.notification.title}, Subtitle:${message.notification.body}, Data:${message.data.toString()}');
        // NavigationService.navigatorKey.currentState.context
        //     .read(notificationListProvider)
        //     .fetchNotifications()
        //     .then((value) => NavigationService.navigatorKey.currentState.context.read(notificationListProvider).markAllNotificationSeen());
        // NavigationService.navigateTo(CupertinoPageRoute(builder: (_) => NotificationScreen()));
      }
    });

    /// Background and terminated
    //fetchInitialMessages();
  }

  /// Background and terminated
  fetchInitialMessages() {
    messaging.getInitialMessage().then((message) {
      if (message != null) {
        print('Background (Terminated): Title:${message.notification.title}, Subtitle:${message.notification.body}, Data:${message.data.toString()}');

        // NavigationService.navigatorKey.currentState.context
        //     .read(notificationListProvider)
        //     .fetchNotifications()
        //     .then((value) => NavigationService.navigatorKey.currentState.context.read(notificationListProvider).markAllNotificationSeen());
        // NavigationService.navigateTo(CupertinoPageRoute(builder: (_) => NotificationScreen()));
      } else {
        // NavigationService.navigateTo(CupertinoPageRoute(builder: (_) => KBottomNavigationBar()));
      }
    });
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(
      'firebaseMessagingBackgroundHandler: Title:${message.notification.title}, Subtitle:${message.notification.body}, Data:${message.data.toString()}');
}
