import 'package:get/get.dart';
import 'package:mindset/screens/splash_screen/splash_screen_ctrl.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenCtrl());
  }
}
