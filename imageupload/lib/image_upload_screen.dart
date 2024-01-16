import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadRoute extends StatefulWidget {
  const ImageUploadRoute({super.key});

  @override
  State<ImageUploadRoute> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUploadRoute> {
  XFile? image;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.amber.shade100,
        title: const Text(
          'Image Slider',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 12.0, 16.0, 15.0),
                child: Column(
                  children: [
                    _passportupload(),
                  ],
                ),
              ),
            ),
          ),
          _bottomButton(),
        ],
      ),
    );
  }

  Widget _passportupload() {
    return const Column();
  }

  Widget _bottomButton() {
    return const Column();
  }
}
