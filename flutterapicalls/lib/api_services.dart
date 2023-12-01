import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapicalls/MultiDataAPIWithModel/multi_data_model.dart';
import 'package:flutterapicalls/MultiplePostModelAPI/post_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterapicalls/SinglePostModelAPI/single_post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<SinglePostWithModel?> getSinglePostWithModel() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
      if (response.statusCode == 200) {
        SinglePostWithModel model =
            SinglePostWithModel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
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
      //print(e.toString());
    }
    return null;
  }

  Future<dynamic> getSinglePostWithoutModel() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
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
      //print(e.toString());
    }
    return null;
  }

  Future<List<PostModel>?> getPostWithModel() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
      if (response.statusCode == 200) {
        List<PostModel> model = List<PostModel>.from(
            json.decode(response.body).map((x) => PostModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
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
      //print(e.toString());
    }
    return null;
  }

  Future<dynamic> getPostWithoutModel() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
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
      //print(e.toString());
    }
    return null;
  }

  Future<MultiData?> getMultiDataWithModel() async {
    try {
      var response = await http.get(Uri.parse('https://reqres.in/api/unknown'));
      if (response.statusCode == 200) {
        MultiData model = MultiData.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
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
      //print(e.toString());
    }
    return null;
  }
}
