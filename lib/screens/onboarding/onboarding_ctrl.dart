import 'package:starter_kit/core/app_ctrl.dart';
import 'package:starter_kit/routes/routes.dart';
import 'package:starter_kit/utils/constants.dart';
import 'package:starter_kit/utils/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingCtrl extends AppCtrl {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  @override
  beforeEnter() async {
    if (await Store.has(Constants.ALREADY_OPEN_KEY)) {
      Get.offAllNamed(Routes.home);
    }
  }

  void skip() async {
    await Store.set(Constants.ALREADY_OPEN_KEY, true);
    Get.offNamed(Routes.home);
  }

  forwardAction() async {
    if (isLastPage) {
      await Store.set(Constants.ALREADY_OPEN_KEY, true);
      //go to home page
      Get.offNamed(Routes.home);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      'assets/img/onboarding/onboard1.png',
      'Easy Eat, votre repas toujours avec vous',
      'En tout temps et en tout lieux, accédez à une large game de repas et boisson en un clic.',
    ),
    OnboardingInfo(
      'assets/img/onboarding/onboard2.png',
      'Des professionnels à vos côtés',
      'Nos professionnels de la restauration vous feront vivre une expérience unique et inobliable.',
    ),
    OnboardingInfo(
      'assets/img/onboarding/onboard3.png',
      "Livraison rapide sur tout l'étendue du térritoire",
      'Pas besoin de vous déplacer. Recevez votre commande en quelques minutes où que vous soyez.',
    ),
  ];
}

class OnboardingInfo {
  final String imageAsset;
  final String title;
  final String description;

  OnboardingInfo(this.imageAsset, this.title, this.description);
}
