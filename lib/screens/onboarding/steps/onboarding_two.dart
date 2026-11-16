import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_kit/components/form/outline_button.dart';
import 'package:starter_kit/screens/onboarding/onboarding_ctrl.dart';

class OnboardingTwo extends GetWidget<OnboardingCtrl> {
  const OnboardingTwo({super.key});

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
                    "assets/img/folder document.png",
                    width: 300,
                    height: 300,
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '.',
                        style: TextStyle(
                          fontSize: 100,
                          color: Color(0xff666666),
                        ),
                      ),
                      Text('.', style: TextStyle(fontSize: 100)),
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
                const Text(
                  'Emportez vos biens partout avec vous',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF444444),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Que vous soyez en réunion, à l'étranger, en voiture ou sur la lune, consultez et gerez vos données à tout instant",
                  style: TextStyle(color: Color(0xff666666), fontSize: 18),
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
