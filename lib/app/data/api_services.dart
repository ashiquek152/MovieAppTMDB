import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unique_games/app/models/movie_model_model.dart';

class APIservices extends GetxController {
  static String BASE_URL = "https://api.themoviedb.org/3";
  static String API_KEY = "3c12ddf4e10d971f7c8e87cb7dada16c";
  static final dio = Dio();

static  Future<List<MovieModel>> fetchMovies() async {
    List<MovieModel> movieModelList = [];

    try {
      final response = await dio.get(
          "$BASE_URL/movie/popular?api_key=$API_KEY&language=en-US&page=1");
      if (response.statusCode == 200) {
        Iterable movies = response.data['results'];
        movieModelList = movies.map((e) => MovieModel.fromJson(e)).toList();
        log("Get movies function called");
      }
      return movieModelList;
    } on DioError catch (e) {
      snackBar(message: e.message, title: "Something went wrong");
      return movieModelList;
    } catch (e) {
      snackBar(message: "Failed to load movies", title: "Error");
      return movieModelList;
    }
  }

 static snackBar({required String message, required String title}) {
    Get.snackbar(
      "",
      "",
      titleText: Text(
        title,
        style: const TextStyle(
            color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 231, 15, 0),
    );
  }
}
