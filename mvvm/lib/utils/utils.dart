import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red.shade600,
        textColor: Colors.black,
        fontSize: 16,
        toastLength: Toast.LENGTH_LONG);
  }

  static void flushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          title: 'Flush Messages',
          messageColor: Colors.black,
          backgroundColor: Colors.amber.shade600,
          duration: const Duration(seconds: 2),
        )..show(context));
  }
}
