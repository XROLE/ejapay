import 'package:ejapay/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    String? fcmToken = await _firebaseMessaging.getToken();
    await initPushNotification();
    print("FCM token =================================> $fcmToken");
  }

  void handleMessage(RemoteMessage? message) {
    print("handleMESSAGE ====================================> $message");
    print(
        "title ====================================> ${message?.notification?.title}");
    print(
        "body ====================================> ${message?.notification?.body}");
    print("data ====================================> ${message?.data}");

    if (message == null) return;

    navigatorKey.currentState?.pushNamed("/notification_screen", arguments: message);
    print("I will navigate ==============================> ");
  }

  Future<void> initPushNotification() async {
    print("Got the notification ====================================> ");
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
