import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarCustom {

  static snackBar({required String message, required String title}) {
    Get.snackbar(
      "",
      "",
      titleText: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
  }
  
}