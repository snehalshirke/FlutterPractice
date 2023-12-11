import 'package:flutter/material.dart';
import 'package:dynamicsortingtable/user.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({super.key});

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  List<User> users;
  @override
  void initState() {
    users = User
    super.initState();
  }

  DataTable dataBody() {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text('First Name'),
          numeric: false,
          tooltip: "This is first name",
        ),
        DataColumn(
          label: Text('Last Name'),
          numeric: false,
          tooltip: "This is Last     name",
        )
      ],
      rows: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Table"),
      ),
      body: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
            child: dataBody(),
          )
        ],
      ),
    );
  }
}
