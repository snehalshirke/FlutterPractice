import 'package:flutter/material.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotification();
}

class _MyNotification extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.amber.shade100,
        title: const Text(
          'Flutter Push Notifications',
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
