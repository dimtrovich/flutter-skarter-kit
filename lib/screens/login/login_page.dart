import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:starter_kit/components/form/index.dart';
import 'package:starter_kit/routes/routes.dart';
import 'package:starter_kit/screens/login/login_ctrl.dart';
import 'package:starter_kit/utils/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo or header image
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/img/logo.png',
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Connectez-vous',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  AppInput(
                    errorText: controller.getError('pseudo'),
                    onChanged: (pseudo) {
                      controller.pseudo.text = pseudo;
                      controller.resetError('pseudo');
                    },
                    controller: controller.pseudo,
                    placeholder: 'Votre Pseudo',
                  ),
                  const SizedBox(height: 32.0),
                  AppInputPassword(
                    controller: controller.code,
                    readOnly: controller.processing.value,
                    errorText: controller.getError('code'),
                    onChanged: (_) => controller.resetError('code'),
                  ),
                  const SizedBox(height: 32.0),
                  AppButton(
                    loading: controller.processing.value,
                    title: 'Connexion',
                    onTap: controller.submitForm,
                  ),

                  const SizedBox(height: 20),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.resetpassword);
                      },
                      child: const Text(
                        "Vous avez oublié votre mot de passe ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: 'Vous êtes un nouveau ? ',
                        style: const TextStyle(fontSize: 14),
                        children: <InlineSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routes.register);
                              },
                            text: 'Créer un compte',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
