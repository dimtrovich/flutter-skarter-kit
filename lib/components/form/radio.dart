
import 'package:flutter/material.dart';
import 'package:starter_kit/utils/app_colors.dart';

class AppRadio extends StatelessWidget {
  final void Function(dynamic)? onChanged;
  final bool selected;
  final String title;
  final dynamic value;
  final dynamic vmodel;

  const AppRadio({
    super.key,
    this.onChanged,
    this.selected = false,
    required this.title, 
    required this.value,
    required this.vmodel,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      activeColor: AppColors.secondary,
      selected: selected,
      title: Text(title),
      value: value,
      groupValue: vmodel,
      onChanged: onChanged,
    );
  }
}
