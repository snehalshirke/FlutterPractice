import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchablelistview/search_bloc.dart';
import 'package:searchablelistview/search_event.dart';
import 'package:searchablelistview/search_word_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return BlocProvider<SearchBloc>(
      create: (_) => SearchBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchWordPage(),
      ),
    );
  }
}
