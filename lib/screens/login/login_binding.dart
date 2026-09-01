import 'package:get/get.dart';
import 'package:mindset/screens/login/login_ctrl.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
