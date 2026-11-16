import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:starter_kit/core/app_ctrl.dart';
import 'package:starter_kit/http/requests/auth_request.dart';
import 'package:starter_kit/routes/routes.dart';
import 'package:starter_kit/services/auth/auth_service.dart';

class LoginController extends AppCtrl {
  // user form fields
  final TextEditingController pseudo = TextEditingController();
  final TextEditingController code = TextEditingController();

  final processing = Rx<bool>(false);
  dynamic errors;

  final AuthService _authService = AuthService();

  @override
  void beforeEnter() async {
    if (await tokenService.isAuthenticated()) {
      Get.offAllNamed(Routes.home); // already authenticate, go to home
    }
  }

  void resetError(String key) {
    if (errors != null) {
      errors[key] = null;
      update();
    }
  }

  String? getError(String key) {
    if (errors == null) {
      return null;
    }
    return errors[key];
  }

  void submitForm() async {
    processing.value = true;
    errors = null;
    update();

    await _authService.login(
      AuthRequest(code: code.text, pseudo: pseudo.text),
      onSuccess: (response) async {
        String token = response.result!['token'];
        await tokenService.saveToken(token);
        Get.toNamed(Routes.home);
      },
      onError: (error) {
        errors = error.errors;
        processing.value = false;
        toastError(error.message!);
        update();
      },
    );
  }
}
