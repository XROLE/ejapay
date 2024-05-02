import 'package:ejapay/app/core/di/service_locator.dart';
import 'package:ejapay/data/remote/remote_config/firebase_remote_config.dart';
import 'package:ejapay/firebase_options.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'presentation/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseRemoteConfigService remoteConfig = FirebaseRemoteConfigService();
  await remoteConfig.init();
  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print("permission =================================> $settings");

  String? fcmToken = await messaging.getToken();
  print("FCM token =================================> $fcmToken");

  bool ss = remoteConfig.getBool(FirebaseRemoteConfigKeys.shouldShowXrole);
  int sss = remoteConfig.getInt(FirebaseRemoteConfigKeys.xrole);

  print("Yoo ===================================== $ss");
  print("Yoo ss ===================================== $sss");
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejapay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
