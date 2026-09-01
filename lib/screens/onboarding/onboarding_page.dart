import 'package:mindset/components/form/outline_button.dart';
import 'package:mindset/screens/onboarding/onboarding_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mindset/utils/app_colors.dart';

class OnboardingPage extends GetWidget<OnboardingCtrl> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
      ),
    );
    return Scaffold(
      body: PageView.builder(
        controller: controller.pageController,
        onPageChanged: controller.selectedPageIndex,
        itemCount: controller.onboardingPages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: const Color(0xfffeefef),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Image.asset(
                          "${controller.onboardingPages[index].imageAsset}",
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.width / 2,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                            controller.onboardingPages.length,
                            (index) => Obx(() {
                              return Container(
                                margin: const EdgeInsets.all(4),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedPageIndex.value ==
                                          index
                                      ? AppColors.primary
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${controller.onboardingPages[index].title}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '${controller.onboardingPages[index].description}',
                        style: const TextStyle(
                          color: Color(0xff666666),
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        // alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: controller.skip,
                              child: const Text(
                                "Ignorer",
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Obx(
                              () => OutlineButton(
                                title: controller.isLastPage
                                    ? 'Démarrer'
                                    : 'Suivant',
                                onTap: controller.forwardAction,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
