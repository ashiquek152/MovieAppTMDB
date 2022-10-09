import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:unique_games/app/models/movie_model_model.dart';
import 'package:unique_games/app/modules/home/widgets/movies_container.dart';
import 'package:unique_games/widgets/text_customized.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TextCustomized(
          text: "Watch",
          textSize: 25,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<MovieModel>?>(
          future: controller.fetchMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child:
                    TextCustomized(text: "Something went wrong", textSize: 18),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              List<MovieModel> movieModelList = snapshot.data!;
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: movieModelList.length,
                itemBuilder: (context, index) {
                  final MovieModel movieModel = movieModelList[index];
                  return MoviesContainer(movieModel: movieModel);
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
