import 'package:get/get.dart';
import 'package:unique_games/app/data/api_services.dart';
import 'package:unique_games/app/models/movie_model_model.dart';

class HomeController extends GetxController {
//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   void increment() => count.value++;
// }

  Future<List<MovieModel>?> fetchMovies() async {
    return await APIservices.fetchMovies();
  }
}
