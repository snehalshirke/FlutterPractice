import 'package:flutter/material.dart';
import 'package:retrofitcallapi/models/post_model.dart';
import 'package:retrofitcallapi/service/api_service.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get apiService => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber.shade100,
            centerTitle: false,
            title: const Text(
              'Retrofit API Call',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          body: _body()),
    );
  }

  FutureBuilder _body() {
    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
      future: apiService.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<PostModel> posts = snapshot.data!;
          return _posts(posts);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _posts(List<PostModel> posts) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Column(children: [
              Text(
                posts[index].title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                posts[index].title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          );
        });
  }
}
