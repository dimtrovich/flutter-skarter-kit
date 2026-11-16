import 'package:flutter/material.dart';
import 'package:starter_kit/utils/app_colors.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({super.key, this.onTap, this.title});
  final void Function()? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        height: 45,
        width: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: AppColors.secondary,
        ),
        child: Center(
          child: Text(
            "$title",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
