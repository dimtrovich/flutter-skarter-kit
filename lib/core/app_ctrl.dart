import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindset/services/auth/token_service.dart';
import 'package:mindset/services/user_service.dart';
import 'package:mindset/services/currency_service.dart';
import 'package:mindset/services/language_service.dart';
import 'package:mindset/services/theme_service.dart';
import 'package:mindset/utils/alerts.dart';
import 'package:mindset/entities/user.dart';
import 'package:mindset/routes/routes.dart';

class AppCtrl extends GetxController {
  final TokenService tokenService = TokenService();
  final UserService userService = UserService();
  ThemeController get themeCtrl => ThemeController.to;
  LanguageController get langCtrl => LanguageController.to;
  CurrencyService get currencyCtrl => CurrencyService.to;

  User user = User();

  @override
  void onReady() {
    super.onReady();
    beforeEnter();
  }

  // to be override by child controller to make another logic
  void beforeEnter() {
    // needAuthenticate();
  }

  void needAuthenticate() async {
    if (!await tokenService.isAuthenticated()) {
      Get.offAllNamed(Routes.login);

      return;
    }

    await userService.loggedUser(
      onSuccess: (user) {
        this.user = user;
        update();
      },
      onError: (error) async {
        logout();
      },
    );
  }

  void logout() async {
    final deletedToken = await tokenService.deleteToken();
    final deletedUser = await userService.deleteLoggedUserInfo();

    if (deletedUser && deletedToken) {
      Get.offAllNamed(Routes.login);
    } else {
      toastError("Une erreur c'est produite");
    }
  }

  void toastError(String message) {
    Toast.danger(message);
  }

  void alertSuccess(String message) {
    Get.snackbar(
      "Success",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }
}
