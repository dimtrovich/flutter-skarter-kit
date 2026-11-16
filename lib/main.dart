import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mindset/routes/pages.dart';
import 'package:mindset/routes/routes.dart';
import 'package:mindset/services/currency_service.dart';
import 'package:mindset/services/language_service.dart';
import 'package:mindset/services/theme_service.dart';
import 'package:mindset/utils/app_colors.dart';
import 'package:mindset/utils/constants.dart';
import 'package:mindset/utils/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation des services transverses GetX (Thème, Langue, Devise)
  final translations = await AppTranslations.load();
  await Get.putAsync(() => ThemeController().init(), permanent: true);
  await Get.putAsync(() => LanguageController().init(), permanent: true);
  await Get.putAsync(() => CurrencyService().init(), permanent: true);

  runApp(App(translations: translations));
}

class App extends StatelessWidget {
  final AppTranslations translations;

  const App({super.key, required this.translations});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    final themeCtrl = ThemeController.to;
    final langCtrl = LanguageController.to;

    return Obx(
      () => GetMaterialApp(
        title: Constants.appTitle,
        theme: _buildLightTheme(),
        darkTheme: _buildDarkTheme(),
        themeMode: themeCtrl.themeMode.value,
        translations: translations,
        locale: langCtrl.locale.value,
        fallbackLocale: const Locale('fr', 'FR'),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashscreen,
        getPages: Pages.pages,
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surfaceLight,
        error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.secondary,
        secondary: AppColors.secondaryLight,
        surface: AppColors.surfaceDark,
        error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
