import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipablebutton/dashboard_screen.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: SwipeableButtonView(
          buttonText: 'Slide to unlock',
          buttonWidget: Container(
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
          ),
          activeColor: const Color(0xff3398f6),
          isFinished: isFinished,
          onWaitingProcess: () {
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                isFinished = true;
              });
            });
          },
          onFinish: () async {
            await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: const DashboardScreen(),
                ));
            setState(() {
              isFinished = false;
            });
          },
        ),
      ),
    );
  }
}
