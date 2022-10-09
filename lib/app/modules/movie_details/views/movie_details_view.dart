import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:unique_games/app/models/movie_model_model.dart';
import 'package:unique_games/widgets/text_customized.dart';

import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  const MovieDetailsView({Key? key, this.movieModel}) : super(key: key);

  final MovieModel? movieModel;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                CachedNetworkImage(
                  height: Get.height * 0.4,
                  width: Get.width,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500${movieModel!.backdropPath}" ??
                          "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0, left: 12),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Flexible(
                        child: TextCustomized(
                          text: movieModel!.title ?? "Movie name not available",
                          textSize: 25,
                          textColor: Colors.white,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.01),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextCustomized(
                    text: "Overview",
                    textSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  TextCustomized(
                    text: movieModel!.overview ?? "Description not available",
                    textSize: 18,
                    maxlines: 10,
                    textColor: Colors.black45,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
