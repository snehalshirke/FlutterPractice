import 'package:flutter/material.dart';
import 'package:flutterapicalls/api_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListPostWithoutModel extends StatefulWidget {
  const ListPostWithoutModel({super.key});

  @override
  State<ListPostWithoutModel> createState() => _ListPostWithoutModelState();
}

class _ListPostWithoutModelState extends State<ListPostWithoutModel> {
  bool isReady = false;
  dynamic postList = [];
  _getPost() {
    ApiServices().getPostWithoutModel().then((value) {
      setState(() {
        isReady = true;
        postList = value!;
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
    });
  }

  @override
  void initState() {
    _getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("List With Modal"),
      ),
      body: isReady == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Text(
                      postList[index]['id'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    title: Text(
                      postList[index]['title'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      postList[index]['body'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
