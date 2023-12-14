import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InkWell(
        onTap: () {
          //==========Navigate to another screen using routes==========
          //Navigator.pushNamed(context, RoutesName.home);

          //==========Toast message added using utils ==========
          Utils.toastMessage('Toast functionality added');
        },
        child: const Text('Click'),
      ),
    ));
  }
}
