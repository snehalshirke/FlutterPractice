// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofitapicall/api_service.dart';
import 'package:retrofitapicall/album_model.dart';

void main() => runApp(const MyApp());

Future<List<Map<String, dynamic>>> fetchAlbum() async {
  final client = ApiClient(
    Dio(
      BaseOptions(contentType: "application/json"),
    ),
  );

  try {
    final response = await client.getAlbum();
    //print(response.body.toString());
    List<Map<String, dynamic>> _map =
        List<Map<String, dynamic>>.from(jsonDecode(response.body.toString()));
    return _map;
  } catch (e) {
    throw Exception("Failed to load Api $e");
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
        body: _login_body(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  FutureBuilder _login_body() {
    final apiService =
        ApiClient(Dio(BaseOptions(contentType: "application/json")));
    //final jsonData = {"name": "morpheus", "job": "leader"};
    return FutureBuilder(
        future: apiService.getAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.done) {
              Album model = snapshot.data!;

              return _posts(model.id.toString());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else if (snapshot.hasError) {
            // Handle errors
            //print("Error: ${snapshot.error}");
            return _posts("Error: ${snapshot.error}");
          } else {
            return _posts("No Data Found!");
          }
        });
  }

  Widget _posts(String posts) {
    return Text(posts);
  }
}
