import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:unique_games/app/data/api_services.dart';
import 'package:unique_games/app/models/movie_model_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeController extends GetxController {
  List<MovieModel> movieModelList = [];
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  String connectionType = "";

  @override
  void onInit() {
    getConnectionStatus();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(getConnectionType);

    super.onInit();
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  Future getConnectionStatus() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await connectivity.checkConnectivity();
      log(connectivityResult.toString());
      getConnectionType(connectivityResult);
    } catch (e) {
      log(e.toString());
    }
  }

  getConnectionType(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.wifi) {
      connectionType = "wifi";
      fetchMovies();
      update();
    } else if (connectivityResult == ConnectivityResult.mobile) {
      connectionType = "mobile";
      fetchMovies();
      update();
    } else if (connectivityResult == ConnectivityResult.none) {
      connectionType = "No Connection";
      update();
    }
  }

  Future<List<MovieModel>?> fetchMovies() async {
    movieModelList = await APIservices.fetchMovies();
    update();
    return movieModelList;
  }
}
