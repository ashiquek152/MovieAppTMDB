import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
