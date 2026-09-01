import 'package:get/get.dart';
import 'package:mindset/core/app_ctrl.dart';
import 'package:mindset/routes/routes.dart';
import 'package:mindset/utils/constants.dart';
import 'package:mindset/utils/store.dart';

class SplashScreenCtrl extends AppCtrl {
  @override
  beforeEnter() async {
    if (await Store.has(Constants.ALREADY_OPEN_KEY)) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.onboarding);
    }
  }
}
