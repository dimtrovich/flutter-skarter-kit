import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindset/routes/routes.dart';
import 'package:mindset/screens/onboarding/onboarding_ctrl.dart';
import 'package:mindset/utils/app_colors.dart';

class OnboardingThree extends GetWidget<OnboardingCtrl> {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            color: const Color(0xfffeefef),
            padding: const EdgeInsets.all(20),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Maisonier c'est du tout en un",
                  style: TextStyle(fontSize: 25, color: Color(0xFF444444)),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Mettez vos biens en avant sur notre plateforme en créant directement des annonces, échangez directement avec vos futurs locataires, des annonces et offrez-vous les meilleurs outils pour faire croitre votre activité comme vous le souhaitez",
                  style: TextStyle(color: Color(0xff666666), fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const ConnectButton(
                      title: "Continuer avec Facebook",
                      icon: Icons.facebook,
                      color: Color(0xFF4249B3),
                    ),
                    const SizedBox(height: 20),
                    const ConnectButton(
                      title: "Continuer avec Apple",
                      icon: Icons.apps_outlined,
                      color: Color(0xFF000000),
                    ),
                    const SizedBox(height: 20),
                    const ConnectButton(
                      title: "Continuer avec Google",
                      icon: Icons.search,
                      color: Color(0xFF6624FF),
                    ),
                    const SizedBox(height: 20),
                    ConnectButton(
                      title: "Continuer avec Flysoft",
                      icon: CupertinoIcons.f_cursive,
                      color: AppColors.primary,
                      onTap: () {
                        Get.toNamed(Routes.home);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ConnectButton extends StatelessWidget {
  const ConnectButton({
    super.key,
    this.icon,
    this.color,
    this.title,
    this.onTap,
  });
  final IconData? icon;
  final Color? color;
  final String? title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 240,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 10),
            Text('$title', style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
