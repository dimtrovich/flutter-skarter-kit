import 'package:get/get.dart';
import 'package:starter_kit/routes/routes.dart';
import 'package:starter_kit/screens/home/export.dart';
import 'package:starter_kit/screens/login/export.dart';
import 'package:starter_kit/screens/onboarding/export.dart';
import 'package:starter_kit/screens/register/export.dart';
import 'package:starter_kit/screens/splash_screen/export.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.splashscreen,
      page: () => const SplashScreenPage(),
      bindings: [SplashScreenBinding()],
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingPage(),
      bindings: [OnboardingBinding()],
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      bindings: [RegisterBinding()],
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      bindings: [HomeBinding()],
    ),
  ];
}
