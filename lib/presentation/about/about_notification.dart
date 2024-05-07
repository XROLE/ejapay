import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class AboutNotification extends StatelessWidget {
  const AboutNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final message =
        ModalRoute.of(context)!.settings.arguments as RemoteMessage;
        
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Title : ${message.notification!.title.toString()}"),
            Text("Body : ${message.notification!.body.toString()}"),
            const Text("Data : {message.data.toString()}"),
          ],
        ),
      ),
    );
  }
}
