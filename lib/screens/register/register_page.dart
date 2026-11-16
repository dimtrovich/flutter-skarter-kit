import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_kit/components/form/index.dart';
import 'package:starter_kit/routes/routes.dart';
import 'package:starter_kit/screens/register/register_ctrl.dart';
import 'package:starter_kit/utils/app_colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterCtrl>(
      builder: (controller) {
        return Scaffold(
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
                    // Header: Logo and title
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
                            'Créez votre compte',
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

                    // Username and Country
                    AppInput(
                      label: 'Pseudonyme',
                      controller: controller.pseudo,
                      readOnly: controller.processing.value,
                      errorText: controller.getError('pseudo'),
                      onChanged: (_) => controller.resetError('pseudo'),
                    ),
                    const SizedBox(height: 20.0),
                    // Password
                    AppInputPassword(
                      controller: controller.code,
                      readOnly: controller.processing.value,
                      errorText: controller.getError('code'),
                      onChanged: (_) => controller.resetError('code'),
                    ),

                    // Submit Button
                    const SizedBox(height: 16.0),
                    AppButton(
                      loading: controller.processing.value,
                      title: 'S\'inscrire',
                      onTap: controller.submitForm,
                    ),

                    // Footer
                    const SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.login);
                        },
                        child: const Text(
                          'Déjà un compte ? Connectez-vous',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
