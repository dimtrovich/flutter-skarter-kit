import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInput extends StatelessWidget {
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
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? placeholder;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? type;
  final String? value;
  final RxString? vmodel;

  const AppInput({
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
    this.label,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.onTap,
    this.placeholder,
    this.readOnly = false,
    this.suffixIcon,
    this.type,
    this.value,
    this.vmodel,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      autofocus: autofocus,
      controller: controller,
      enabled: enabled,
      expands: expands,
      focusNode: focusNode,
      keyboardType: _inputType(),
      keyboardAppearance: keyboardAppearance,
      maxLines: _maxLines(),
      minLines: _minLines(),
      obscureText: type == 'password',
      onChanged: (String value) {
        if (onChanged != null) {
          onChanged!(value);
        } else if(vmodel != null) {
          vmodel!.value = value;
        }
      },
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: _border(),
        contentPadding: contentPadding,
        errorText: errorText,
        focusedBorder: _focusedBorder(),
        labelText: label,
        hintText: placeholder,
        suffixIcon: suffixIcon,
      ),
    );
  }

  TextInputType _inputType() {
    switch (type) {
      case 'number':
        return TextInputType.number;
      case 'tel':
      case 'phone':
        return TextInputType.phone;
      case 'email':
        return TextInputType.emailAddress;
      case 'password':
        return TextInputType.visiblePassword;
      case 'date':
      case 'time':
      case 'datetime':
        return TextInputType.datetime;
      case 'url':
        return TextInputType.url;
      case 'textarea':
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  int? _maxLines() {
    if (type != 'textarea') {
      return 1;
    }
    return maxLines;
  }

  int? _minLines() {
    if (type != 'textarea') {
      return 1;
    }
    return minLines;
  }

  InputBorder _border() {
    if (null == border) {
      return OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
      );
    }
    return border!;
  }

  InputBorder _focusedBorder() {
    if (null != focusedBorder) {
      return focusedBorder!;
    }
    
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.orange),
    );
  }


}
