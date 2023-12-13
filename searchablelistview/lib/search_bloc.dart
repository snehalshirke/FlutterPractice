import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchablelistview/search_event.dart';
import 'package:searchablelistview/search_state.dart';
import 'package:searchablelistview/search_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(LoadedWords(words: words)) {
    on<SearchWord>((event, emit) {
      List<String> searchedTitles = [];
      for (var element in words) {
        if (element.contains(event.word)) {
          searchedTitles.add(element);
        }
      }
      emit(LoadedWords(words: searchedTitles));
    });
  }
  static List<String> words = [
    'flutter',
    'Google',
    'Tutorial',
    'dart',
    'state managment',
    'project',
    'Course'
  ];
}
