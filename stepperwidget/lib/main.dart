import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.amber.shade100,
        title: const Text('Stepper Widget'),
      ),
      body: Stepper(
        steps: const [
          Step(
            title: Text('Step 1'),
            content: Text('This is First step'),
          ),
          Step(
            title: Text('Step 2'),
            content: Text('This is Second step'),
          ),
          Step(
            title: Text('Step 3'),
            content: Text('This is Third step'),
          ),
        ],
      ),
    );
  }
}
