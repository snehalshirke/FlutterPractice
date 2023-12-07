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
  int currentStep = 0;
  continueStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep = currentStep + 1;
      });
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  Widget controlsBuilder(context, details) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: details.onStepContinue,
          child: const Text('Next'),
        ),
        ElevatedButton(onPressed: details.onStepCancel, child: Text('Back'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.amber.shade100,
        title: const Text(
          'Stepper Widget',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
      body: Stepper(
        currentStep: currentStep,
        onStepContinue: continueStep,
        onStepCancel: cancelStep,
        onStepTapped: onStepTapped,
        controlsBuilder: controlsBuilder,
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
