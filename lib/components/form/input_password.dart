import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindset/components/form/index.dart';

class AppInputPassword extends StatefulWidget {
  final bool autofocus;
  final InputBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final bool? enabled;
  final String? errorText;
  final bool expands;
  final InputBorder? focusedBorder;
  final FocusNode? focusNode;
  final Brightness? keyboardAppearance;
  final String? label;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? placeholder;
  final bool readOnly;
  final String? value;
  final RxString? vmodel;

  const AppInputPassword({
    super.key,
    this.autofocus = false,
    this.border,
    this.borderRadius,
    this.color,
    this.contentPadding,
    this.controller,
    this.enabled = true,
    this.errorText,
    this.expands = false,
    this.focusedBorder,
    this.focusNode,
    this.keyboardAppearance,
    this.label = 'Mot de passe',
    this.onChanged,
    this.onTap,
    this.placeholder,
    this.readOnly = false,
    this.value,
    this.vmodel,
  });

  @override
  State<AppInputPassword> createState() => _AppInputPasswordState();
}

class _AppInputPasswordState extends State<AppInputPassword> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AppInput(
      autofocus: widget.autofocus,
      border: widget.border,
      borderRadius: widget.borderRadius,
      color: widget.color,
      contentPadding: widget.contentPadding,
      controller: widget.controller,
      enabled: widget.enabled,
      errorText: widget.errorText,
      expands: widget.expands,
      focusedBorder: widget.focusedBorder,
      focusNode: widget.focusNode,
      label: widget.label,
      keyboardAppearance: widget.keyboardAppearance,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      placeholder: widget.placeholder,
      readOnly: widget.readOnly,
      type: passwordVisible ? 'text' : 'password',
      value: widget.value,
      vmodel: widget.vmodel,
      suffixIcon: IconButton(
        icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
      ),
    );
  }
}
