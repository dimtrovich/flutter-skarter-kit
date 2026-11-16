import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindset/utils/app_colors.dart';

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
  final Widget? prefixIcon;
  final String? type;
  final String? value;
  final RxString? vmodel;
  final Color? textColor;
  final Color? hintColor;

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
    this.prefixIcon,
    this.type,
    this.value,
    this.vmodel,
    this.textColor,
    this.hintColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
      style: TextStyle(
        fontSize: 15,
        color: textColor ??
            (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: color ??
            (isDark ? AppColors.inputFillDark : AppColors.inputFillLight),
        hintText: placeholder,
        hintStyle: TextStyle(
          color: hintColor ??
              (isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight),
          fontSize: 15,
        ),
        labelText: label,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: _border(),
        enabledBorder: _enabledBorder(),
        focusedBorder: _focusedBorder(),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
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

  InputBorder _enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }

  InputBorder _focusedBorder() {
    if (null != focusedBorder) {
      return focusedBorder!;
    }
    
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
    );
  }
}
