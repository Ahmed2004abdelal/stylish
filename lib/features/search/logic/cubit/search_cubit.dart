// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:stylish/features/search/logic/cubit/search_state.dart';

import '../../data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  final TextEditingController searchController = TextEditingController();
  final SearchRepoImpl searchRepoImpl;
  SearchCubit(
    {required this.searchRepoImpl,}
  ) : super(SearchState.initial());

  void search(String query) async {
    emit(SearchState.loading());
    try {
      final products = await searchRepoImpl.searchProducts(query);
      emit(SearchState.success(products));
    } catch (e) {
      emit(SearchState.error(e.toString()));
    }
  }
}
