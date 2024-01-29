import 'package:flutter/material.dart';
import 'package:flutterapicalls/api_services.dart';
import 'package:flutterapicalls/SinglePostModelAPI/single_post_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isReady = false;
  SinglePostWithModel singlePostWithModel = SinglePostWithModel();
  _getSinglePost() {
    isReady = true;
    ApiServices().getSinglePostWithModel().then((value) {
      setState(() {
        singlePostWithModel = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Single Post Model Class'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            singlePostWithModel.userId.toString(),
            style: const TextStyle(fontSize: 20, color: Colors.blue),
          ),
          Text(
            singlePostWithModel.title.toString(),
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
          Text(
            singlePostWithModel.body.toString(),
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
