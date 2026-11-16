import 'package:get/get.dart';
import 'package:starter_kit/screens/register/register_ctrl.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterCtrl());
  }
}
