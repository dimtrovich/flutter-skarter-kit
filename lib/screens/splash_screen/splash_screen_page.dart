import 'package:starter_kit/screens/splash_screen/splash_screen_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenPage extends GetWidget<SplashScreenCtrl> {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/img/logo.png", width: 80)),
    );
  }
}
