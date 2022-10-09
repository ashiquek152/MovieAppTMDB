import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:unique_games/app/models/movie_model_model.dart';
import 'package:unique_games/widgets/movies_container.dart';
import 'package:unique_games/widgets/text_customized.dart';

import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  SearchScreenView({Key? key}) : super(key: key);
  final searchController = Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          tooltip: "Back to home",
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const TextCustomized(
          text: "Search",
          textSize: 25,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextFormField(
              controller: searchController.searchFildcontroller,
              style: const TextStyle(fontFamily: "Poppins"),
              decoration: InputDecoration(
                hintText: "Search by movies",
                suffixIcon: const Icon(Icons.search, color: Colors.black),
                border: textfieldBorder(),
                focusedBorder: textfieldBorder(),
                errorBorder: textfieldBorder(),
                enabledBorder: textfieldBorder(),
                disabledBorder: textfieldBorder(),
                focusedErrorBorder: textfieldBorder(),
              ),
              onChanged: (query) => searchController.searchMovies(query: query),
            ),
            
            GetBuilder<SearchScreenController>(builder: (context) {
              return searchController.searchList.isNotEmpty &&
                      searchController.searchFildcontroller.text != ""
                  ? Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: searchController.searchList.length,
                        itemBuilder: (context, index) {
                          final MovieModel movieModel =
                              searchController.searchList[index];
                          return MoviesContainer(movieModel: movieModel);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      ),
                    )
                  : Container();
            }),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder textfieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    );
  }
}
