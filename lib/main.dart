import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mindset/routes/pages.dart';
import 'package:mindset/routes/routes.dart';
import 'package:mindset/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: 'MindSet',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        fontFamily: 'Quicksand',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashcreen,
      getPages: Pages.pages,
    );
  }

  ThemeData buildDarkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.darkBackgroundDeep,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primaryTeal,
        surface: AppColors.darkSurfaceCard,
        // background: AppColors.darkBackgroundDeep,
      ),
      cardColor: AppColors.darkSurfaceCard,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
        bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
      ),
    );
  }
}
