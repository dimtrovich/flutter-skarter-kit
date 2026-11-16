import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_kit/utils/constants.dart';
import 'package:starter_kit/utils/store.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find<ThemeController>();

  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  bool get isDarkMode {
    if (themeMode.value == ThemeMode.system) {
      return Get.isPlatformDarkMode;
    }
    return themeMode.value == ThemeMode.dark;
  }

  Future<ThemeController> init() async {
    final saved = await Store.getString(Constants.THEME_MODE_KEY);
    if (saved == 'dark') {
      themeMode.value = ThemeMode.dark;
    } else if (saved == 'light') {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.system;
    }
    return this;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    final str = mode == ThemeMode.dark
        ? 'dark'
        : mode == ThemeMode.light
        ? 'light'
        : 'system';
    await Store.set(Constants.THEME_MODE_KEY, str);
    update();
  }

  Future<void> toggleDarkLight() async {
    final next = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(next);
  }
}
