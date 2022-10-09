import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movie_details/bindings/movie_details_binding.dart';
import '../modules/movie_details/views/movie_details_view.dart';
import '../modules/search_screen/bindings/search_screen_binding.dart';
import '../modules/search_screen/views/search_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAILS,
      page: () =>   const MovieDetailsView(),
      binding: MovieDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () =>  SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
  ];
}
