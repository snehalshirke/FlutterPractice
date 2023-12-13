import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchablelistview/search_bloc.dart';
import 'package:searchablelistview/search_event.dart';
import 'package:searchablelistview/search_state.dart';

class SearchWordPage extends StatelessWidget {
  const SearchWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.amber.shade100,
        title: const Text(
          'Searchable List',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          _searchFiled(context),
          _words(context),
        ],
      ),
    );
  }

  Widget _searchFiled(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
        ),
        onChanged: (value) {
          context.read<SearchBloc>().add(SearchWord(word: value));
        },
      ),
    );
  }

  Widget _words(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is LoadedWords) {
          return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemBuilder: ((context, index) {
                return Text(
                  //index.toString(),
                  state.words[index],
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                );
              }),
              separatorBuilder: (context, index) => const Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
              itemCount: state.words.length);
        }
        return Container();
      },
    );
  }
}
