import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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

            //==========Flushbar message added using utils ==========
            Utils.flushbarErrorMessage('FlushBar functionality added', context);

            //==========SnackBar message added using utils ==========
            Utils.snakBar('SnackBar functionality added', context);
          },
          child: const Text('Click'),
        ),
      ),
    );
  }
}
