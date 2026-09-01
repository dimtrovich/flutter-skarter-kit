import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toast {
  static void danger(String message, {
    double? margin = 20,
    SnackPosition? position = SnackPosition.TOP
  }) {
    Get.snackbar('Erreur', message,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: position,
      margin: EdgeInsets.all(margin!));
  }
}