import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:unique_games/app/models/movie_model_model.dart';
import 'package:unique_games/widgets/movies_container.dart';
import 'package:unique_games/app/modules/search_screen/views/search_screen_view.dart';
import 'package:unique_games/widgets/text_customized.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.connectionType == "wifi" ||
            controller.connectionType == "mobile") {
          return const HomeScreen();
        } else {
          return const NoConnectionView();
        }
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const TextCustomized(
          text: "Watch",
          textSize: 25,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => SearchScreenView()),
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return controller.movieModelList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          TextCustomized(
                            text: "Please Wait...",
                            textSize: 20,
                            textColor: Colors.black45,
                          )
                        ],
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: controller.movieModelList.length,
                      itemBuilder: (context, index) {
                        final MovieModel movieModel =
                            controller.movieModelList[index];
                        return MoviesContainer(movieModel: movieModel);
                      },
                    );
            },
          )),
    );
  }
}

class NoConnectionView extends StatelessWidget {
  const NoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextCustomized(
          text: "You are not connected",
          textSize: 25,
          fontWeight: FontWeight.bold,
          textColor: Colors.black45,
        ),
      ),
    );
  }
}
