import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindset/screens/home/home_ctrl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCtrl>(
      builder: (controller) =>
          Scaffold(backgroundColor: Colors.white, body: Text("Hello")),
    );
  }
}
