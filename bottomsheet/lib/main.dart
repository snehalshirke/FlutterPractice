import 'package:bottomsheet/colorchangingbottonsheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomSheet',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'BottomSheet',
            style: TextStyle(
                fontSize: 16, color: Colors.black, letterSpacing: 0.6),
          ),
          backgroundColor: Colors.amber.shade100,
        ),
        body: const ModalBottomSheetDemo(),
      ),
    );
  }
}

class ModalBottomSheetDemo extends StatelessWidget {
  const ModalBottomSheetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Show Modal BottomSheet'),
        onPressed: () {
// when raised button is pressed
          // we display showModalBottomSheet
          showModalBottomSheet<void>(
// context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {
              // we set up a container inside which
              // we create center column and display text

              // Returning SizedBox instead of a Container
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

      // RaisedButton is deprecated and should not be used
      // Use ElevatedButton instead.

      // child: RaisedButton(
      //	 child: const Text('showModalBottomSheet'),
      //	 onPressed: () {

      //	 // when raised button is pressed
      //	 // we display showModalBottomSheet
      //	 showModalBottomSheet<void>(

      //		 // context and builder are
      //		 // required properties in this widget
      //		 context: context,
      //		 builder: (BuildContext context) {

      //		 // we set up a container inside which
      //		 // we create center column and display text
      //		 return Container(
      //			 height: 200,
      //			 child: Center(
      //			 child: Column(
      //				 mainAxisAlignment: MainAxisAlignment.center,
      //				 children: <Widget>[
      //				 const Text('GeeksforGeeks'),
      //				 ],
      //			 ),
      //			 ),
      //		 );
      //		 },
      //	 );
      //	 },
      // ),
    );
  }
}
