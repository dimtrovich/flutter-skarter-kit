import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_kit/routes/routes.dart';
import 'package:starter_kit/services/language_service.dart';
import 'package:starter_kit/services/theme_service.dart';
import 'package:starter_kit/utils/app_colors.dart';
import 'package:starter_kit/screens/home/home_ctrl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCtrl>(
      builder: (controller) => Obx(() {
        LanguageController.to.locale.value;
        final themeController = ThemeController.to;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Starter Kit'),
            actions: [
              TextButton(
                onPressed: LanguageController.to.toggleLanguage,
                child: Text(
                  LanguageController.to.currentCode.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              IconButton(
                tooltip: 'toggle_theme'.tr,
                onPressed: themeController.toggleDarkLight,
                icon: Icon(
                  themeController.isDarkMode
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                'starter_welcome'.tr,
                style: Theme.of(context).textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'starter_description'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              _FeatureCard(
                icon: Icons.translate,
                title: 'feature_language'.tr,
                description: 'feature_language_description'.tr,
                trailing: TextButton(
                  onPressed: LanguageController.to.toggleLanguage,
                  child: Text('change_language'.tr),
                ),
              ),
              _FeatureCard(
                icon: Icons.dark_mode_outlined,
                title: 'feature_theme'.tr,
                description: 'feature_theme_description'.tr,
                trailing: TextButton(
                  onPressed: themeController.toggleDarkLight,
                  child: Text('toggle_theme'.tr),
                ),
              ),
              _FeatureCard(
                icon: Icons.alt_route,
                title: 'feature_routing'.tr,
                description: 'feature_routing_description'.tr,
                trailing: Wrap(
                  spacing: 8,
                  children: [
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.login),
                      child: Text('login_demo'.tr),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.register),
                      child: Text('register_demo'.tr),
                    ),
                  ],
                ),
              ),
              _FeatureCard(
                icon: Icons.cloud_outlined,
                title: 'feature_api'.tr,
                description: 'feature_api_description'.tr,
                trailing: FilledButton(
                  onPressed: controller.isLoading
                      ? null
                      : controller.requestSampleApi,
                  child: Text(
                    controller.isLoading ? 'api_loading'.tr : 'try_api'.tr,
                  ),
                ),
              ),
              if (controller.apiResult != null ||
                  controller.apiError != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: controller.apiError == null
                          ? AppColors.success
                          : AppColors.error,
                    ),
                  ),
                  child: SelectableText(
                    controller.apiResult ??
                        '${'api_error'.tr}: ${controller.apiError}',
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Text(
                'api_endpoint'.tr,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String description;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(description),
                  if (trailing != null) ...[
                    const SizedBox(height: 8),
                    trailing!,
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
