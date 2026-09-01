import 'package:flutter/material.dart';
import 'package:mindset/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  final bool loading;
  final String title;
  final void Function()? onTap;

  const AppButton({
    super.key,
    this.loading = false,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          )
        : ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(25.0),
              backgroundColor: AppColors.primary,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
