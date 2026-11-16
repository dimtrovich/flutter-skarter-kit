import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_colors.dart';

class Toast {
  static void danger(
    String message, {
    double? margin = 20,
    SnackPosition? position = SnackPosition.TOP,
  }) {
    Get.snackbar(
      'Erreur',
      message,
      colorText: Colors.white,
      backgroundColor: AppColors.error,
      snackPosition: position,
      margin: EdgeInsets.all(margin!),
    );
  }

  static void success(
    String message, {
    double? margin = 20,
    SnackPosition? position = SnackPosition.TOP,
  }) {
    Get.snackbar(
      'Succès',
      message,
      colorText: Colors.white,
      backgroundColor: AppColors.success,
      snackPosition: position,
      margin: EdgeInsets.all(margin!),
    );
  }

  static void warning(
    String message, {
    double? margin = 20,
    SnackPosition? position = SnackPosition.TOP,
  }) {
    Get.snackbar(
      'Attention',
      message,
      colorText: AppColors.primary,
      backgroundColor: AppColors.warning,
      snackPosition: position,
      margin: EdgeInsets.all(margin!),
    );
  }

  static void info(
    String message, {
    double? margin = 20,
    SnackPosition? position = SnackPosition.TOP,
  }) {
    Get.snackbar(
      'Info',
      message,
      colorText: Colors.white,
      backgroundColor: AppColors.info,
      snackPosition: position,
      margin: EdgeInsets.all(margin!),
    );
  }
}
