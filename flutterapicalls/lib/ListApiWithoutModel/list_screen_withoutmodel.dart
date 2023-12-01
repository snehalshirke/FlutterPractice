import 'package:flutter/material.dart';
import 'package:flutterapicalls/api_services.dart';

class listPostWithoutModel extends StatefulWidget {
  const listPostWithoutModel({super.key});

  @override
  State<listPostWithoutModel> createState() => _listPostWithoutModelState();
}

class _listPostWithoutModelState extends State<listPostWithoutModel> {
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
      print(error);
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
        title: Text("List With Modal"),
      ),
      body: isReady == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Text(
                      postList[index]['id'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    title: Text(
                      postList[index]['title'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      postList[index]['body'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
