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
}
