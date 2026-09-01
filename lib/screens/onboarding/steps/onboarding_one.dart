import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindset/components/form/outline_button.dart';
import 'package:mindset/screens/onboarding/onboarding_ctrl.dart';

class OnboardingOne extends GetWidget<OnboardingCtrl> {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            color: const Color(0xfffeefef),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    "assets/img/Houses-cuate.svg",
                    width: 300,
                    height: 300,
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('.', style: TextStyle(fontSize: 100)),
                      Text(
                        '.',
                        style: TextStyle(
                          fontSize: 100,
                          color: Color(0xff666666),
                        ),
                      ),
                      Text(
                        '.',
                        style: TextStyle(
                          fontSize: 100,
                          color: Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Maisonier, l’outil idéal pour une gestion immobilière aisée",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF444444),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Gérez vos locataires, consultez vos données, la rentabilité de vos biens, l'action de votre activité sur le temps, optimisez vos gains et bien plus encore.",
                      style: TextStyle(color: Color(0xff666666), fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                Expanded(
                  // alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Ignorer",
                          style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      OutlineButton(onTap: controller.forwardAction()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
