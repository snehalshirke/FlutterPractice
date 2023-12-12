import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class ModalBottomSheetDemo2 extends StatelessWidget {
  const ModalBottomSheetDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // REPLACED: RaisedButton class with Elevated button class.
      // Raisedbutton is deprecatred and shouldn't be used.

      child: ElevatedButton(
        child: const Text('Show Modal BottomSheet'),
        onPressed: () {
          // adding some properties
          showModalBottomSheet(
            context: context,
            // color is applied to main screen when modal bottom screen is displayed
            barrierColor: Colors.greenAccent,
            //background color for modal bottom screen
            backgroundColor: Colors.yellow,
            //elevates modal bottom screen
            elevation: 10,
            // gives rounded corner to modal bottom screen
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            builder: (BuildContext context) {
              // UDE : SizedBox instead of Container for whitespaces
              return const SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Close Bottomsheet'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
