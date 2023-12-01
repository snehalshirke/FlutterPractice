//changes
import 'package:flutter/material.dart';
import 'package:flutterapicalls/MultiplePostModelAPI/post_model.dart';
import 'package:flutterapicalls/api_services.dart';

class ScreenMultiWidget extends StatefulWidget {
  const ScreenMultiWidget({super.key});

  @override
  State<ScreenMultiWidget> createState() => _ScreenMultiWidgetState();
}

class _ScreenMultiWidgetState extends State<ScreenMultiWidget> {
  bool isReady = false;
  List<PostModel> postmodel = [];
  _getPost() {
    isReady = true;
    ApiServices().getPostWithModel().then((value) {
      setState(() {
        postmodel = value!;
        isReady = false;
      });
    }).onError((error, stackTrace) {});
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
              itemCount: postmodel.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Text(
                      postmodel[index].id.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    title: Text(
                      postmodel[index].title.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      postmodel[index].body.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
