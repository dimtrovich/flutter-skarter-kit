import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  final Map<String, Map<String, String>> _keys;

  AppTranslations(this._keys);

  static Future<AppTranslations> load() async {
    final frStr = await rootBundle.loadString('assets/lang/fr.json');
    final enStr = await rootBundle.loadString('assets/lang/en.json');

    final Map<String, String> fr = Map<String, String>.from(json.decode(frStr));
    final Map<String, String> en = Map<String, String>.from(json.decode(enStr));

    return AppTranslations({
      'fr': fr,
      'fr_FR': fr,
      'en': en,
      'en_US': en,
    });
  }

  @override
  Map<String, Map<String, String>> get keys => _keys;
}
