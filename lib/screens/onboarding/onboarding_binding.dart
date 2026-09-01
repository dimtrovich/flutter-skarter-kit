import 'package:mindset/screens/onboarding/onboarding_ctrl.dart';
import 'package:get/get.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingCtrl());
  }
}
