import 'package:starter_kit/screens/home/home_ctrl.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeCtrl());
  }
}
