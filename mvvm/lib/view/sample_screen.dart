import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({super.key});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Mountain Picture",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularListView(
                    imagePath: 'assets/images/logoimg.jpg', name: 'Flow Text'),
                CircularListView(
                    imagePath: 'assets/images/logoimg.jpg', name: 'Flow Text2'),
                CircularListView(
                    imagePath: 'assets/images/logoimg.jpg', name: 'Flow Text3'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularListView extends StatelessWidget {
  final String imagePath;
  final String name;

  const CircularListView({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1.0), // Black border
          ),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ClipOval(
              child: Image.asset(imagePath),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(name),
      ],
    );
  }
}
