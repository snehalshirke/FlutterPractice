import 'package:flutter/material.dart';
import 'package:flutterapicalls/api_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  dynamic singlePost;
  bool isReady = false;
  _getSinglePostWithoutModel() {
    isReady = true;
    ApiServices().getSinglePostWithoutModel().then((value) {
      setState(() {
        singlePost = value;
        isReady = false;
      });
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast
            .LENGTH_SHORT, // Duration for which the toast should be visible
        gravity:
            ToastGravity.BOTTOM, // Position of the toast message on the screen
        timeInSecForIosWeb:
            1, // Time for which the message will be displayed on the screen
        backgroundColor:
            Colors.blue.shade100, // Background color of the toast message
        textColor: Colors.black, // Text color of the toast message
        fontSize: 16.0, // Font size of the toast message text
      );
      isReady = false;
    });
  }

  @override
  void initState() {
    _getSinglePostWithoutModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Screen Without Model class'),
      ),
      body: isReady == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  singlePost["userId"].toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  singlePost["id"].toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  singlePost["title"].toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
                Text(
                  singlePost["body"].toString(),
                  style: const TextStyle(fontSize: 15, color: Colors.green),
                ),
              ],
            ),
    );
  }
}
