import 'package:flutter/material.dart';
import 'package:push_notification_demo/pushnotification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Push Notifications',
      home: MyNotification(),
    );
  }
}
