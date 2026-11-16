import 'package:get/get.dart';
import 'package:starter_kit/core/app_ctrl.dart';
import 'package:starter_kit/routes/routes.dart';
import 'package:starter_kit/utils/constants.dart';
import 'package:starter_kit/utils/store.dart';

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
