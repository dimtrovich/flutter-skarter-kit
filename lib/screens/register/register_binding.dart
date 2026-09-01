import 'package:get/get.dart';
import 'package:mindset/screens/register/register_ctrl.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterCtrl());
  }
}
