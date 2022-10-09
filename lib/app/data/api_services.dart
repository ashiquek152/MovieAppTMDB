import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:unique_games/app/models/movie_model_model.dart';
import 'package:unique_games/widgets/snackbar.dart';

import 'api_key.dart';

class APIservices extends GetxController {
  static String BASE_URL = "https://api.themoviedb.org/3";
  static final dio = Dio();

  static Future<List<MovieModel>> fetchMovies() async {
    List<MovieModel> movieModelList = [];
    try {
      final response = await dio.get(
          "$BASE_URL/movie/popular?api_key=$API_KEY&language=en-US");
      if (response.statusCode == 200) {
        Iterable movies = response.data['results'];
        movieModelList = movies.map((e) => MovieModel.fromJson(e)).toList();
        log("Get movies function called");
      }
      return movieModelList;
    } on DioError catch (e) {
      SnackBarCustom.snackBar(
          message: e.message, title: "Something went wrong");
      return movieModelList;
    } catch (e) {
      SnackBarCustom.snackBar(message: "Failed to load movies", title: "Error");
      return movieModelList;
    }
  }

  static Future<List<MovieModel>> searchMovies({required String query}) async {
    List<MovieModel> searchList = [];
    try {
      final response = await dio.get(
          "$BASE_URL/search/movie?api_key=$API_KEY&language=en-US&page=1&include_adult=false&query=$query");
      if (response.statusCode == 200) {
        Iterable movies = response.data['results'];
        searchList = movies.map((e) => MovieModel.fromJson(e)).toList();
        log("Search function called");
      }
      return searchList;
    } on DioError catch (e) {
      SnackBarCustom.snackBar(
          message: e.message, title: "Something went wrong");
      return searchList;
    } catch (e) {
      SnackBarCustom.snackBar(message: "Failed to load movies", title: "Error");
      return searchList;
    }
  }
}
