import 'package:flutter/material.dart';
import 'package:flutterapicalls/MultiDataAPIWithModel/multi_data_model.dart';
import 'package:flutterapicalls/api_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MultiDataWidget extends StatefulWidget {
  const MultiDataWidget({super.key});

  @override
  State<MultiDataWidget> createState() => _MultiDataWidgetState();
}

class _MultiDataWidgetState extends State<MultiDataWidget> {
  MultiData multidata = MultiData();
  _getMultiData() {
    ApiServices().getMultiDataWithModel().then((value) {
      setState(() {
        multidata = value!;
      });
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
        msg: error.toString(),
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
      //print(error);
    });
  }

  @override
  void initState() {
    _getMultiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Screen Multi Data'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(multidata.page.toString()),
          Text(multidata.perPage.toString()),
          Text(multidata.total.toString()),
          Text(multidata.totalPages.toString()),
          Text(multidata.support!.text.toString()),
          Expanded(
            child: ListView.builder(
              itemCount: multidata.data!.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(
                      multidata.data![i].name.toString().toUpperCase(),
                    ),
                    subtitle: Text(
                      multidata.data![i].pantoneValue.toString(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
