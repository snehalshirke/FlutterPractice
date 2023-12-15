import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';

class UtilExample extends StatefulWidget {
  const UtilExample({super.key});

  @override
  State<UtilExample> createState() => _UtilExampleState();
}

class _UtilExampleState extends State<UtilExample> {
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
