import 'package:get/get.dart';
import 'package:mindset/routes/routes.dart';
import 'package:mindset/screens/home/export.dart';
import 'package:mindset/screens/login/export.dart';
import 'package:mindset/screens/onboarding/export.dart';
import 'package:mindset/screens/register/export.dart';
import 'package:mindset/screens/splash_screen/export.dart';

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
