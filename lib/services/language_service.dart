import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_kit/utils/constants.dart';
import 'package:starter_kit/utils/store.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find<LanguageController>();

  final Rx<Locale> locale = const Locale('fr', 'FR').obs;

  String get currentCode => locale.value.languageCode;

  Future<LanguageController> init() async {
    final saved = await Store.getString(Constants.LOCALE_KEY);
    if (saved == 'en') {
      locale.value = const Locale('en', 'US');
    } else {
      locale.value = const Locale('fr', 'FR');
    }
    return this;
  }

  Future<void> setLanguage(String langCode) async {
    final nextLocale = langCode == 'en'
        ? const Locale('en', 'US')
        : const Locale('fr', 'FR');
    locale.value = nextLocale;
    Get.updateLocale(nextLocale);
    await Store.set(Constants.LOCALE_KEY, langCode);
    update();
  }

  Future<void> toggleLanguage() async {
    await setLanguage(currentCode == 'fr' ? 'en' : 'fr');
  }
}
