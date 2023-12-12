import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Lottie.network(
              'https://lottie.host/85f28292-7a92-4526-8b44-d850f7982f4b/FF2pUV77zL.json',
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
