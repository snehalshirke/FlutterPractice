import 'package:flutter/material.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 3){
    //   Navigator.push(
    //     context,
    //      MaterialPageRoute(
    //       builder: (context) => Onboarding(),
    //       ),
    //       );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/png/img logo.png",
            ),
            const Text(
              "Medtech",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
