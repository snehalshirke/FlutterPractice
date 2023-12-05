import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofitapicall/api_service.dart';

void main() => runApp(const MyApp());

Future<Album> fetchAlbum() async {
  final client = ApiClient(
    Dio(
      BaseOptions(contentType: "application/json"),
    ),
  );

  try {
    final response = await client.getAlbum();
    return response;
  } catch (e) {
    throw Exception("Failed to load Api");
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Retrofit API Call',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              fetchAlbum().then((value) {
                print(value.id);
                print(value.title);
                print(value.userId);
              });
            },
            child: const Text('API Request'),
          ),
        ),
      ),
    );
  }
}

class Album {
  final int userId;
  final int id;
  final String title;
  const Album({required this.id, required this.userId, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], userId: json['userId'], title: json['title']);
  }
}
