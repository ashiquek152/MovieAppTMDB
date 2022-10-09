import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unique_games/app/models/movie_model_model.dart';
import 'package:unique_games/app/modules/movie_details/views/movie_details_view.dart';
import 'package:unique_games/widgets/text_customized.dart';

class MoviesContainer extends StatelessWidget {
  const MoviesContainer({super.key, required this.movieModel});

  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=>MovieDetailsView(movieModel: movieModel)),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                height: Get.height * 0.25,
                width: Get.width,
                fit: BoxFit.cover,
                imageUrl:
                    "https://image.tmdb.org/t/p/w500${movieModel.backdropPath}" ??
                        "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: Get.width,
                height: Get.height*0.08,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.centerLeft,
                decoration:  BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 0.1,
                      blurStyle: BlurStyle.inner
                    ),
                  ]
                ),
                child: TextCustomized(
                  text: movieModel.title ?? "Movie name not available",
                  textSize: 25,
                  textColor: Colors.white,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
