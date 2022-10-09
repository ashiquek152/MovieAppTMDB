import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unique_games/app/data/api_services.dart';
import 'package:unique_games/app/models/movie_model_model.dart';

class SearchScreenController extends GetxController {
  final searchFildcontroller = TextEditingController();

  List<MovieModel> searchList = <MovieModel>[].obs;

  Future<List<MovieModel>> fetchMovies() async {
    return await APIservices.fetchMovies();
  }

  searchMovies({required String query}) async {
    try {
      if (searchFildcontroller.text == "") {
        searchList.clear();
        update();
      }
      if (query == "") {
        update();
        return;
      }
      searchList.clear();
      searchList = await APIservices.searchMovies(query: query);
      update();
    } catch (e) {
      log(e.toString());
    }
  }
}
