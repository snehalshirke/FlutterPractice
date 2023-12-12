import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    AnimationController animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animation.addListener(() {
      setState(() {
        print(animation.value.toString());
      });
    });
    animation.addStatusListener((status) {
      print(status);
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Container(
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
