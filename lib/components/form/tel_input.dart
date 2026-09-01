import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class AppTelInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorText;
  final String label;
  final void Function(Country)? onCountryChanged;
  final void Function(PhoneNumber)? onChanged;
  final bool readOnly;
  final RxString? vmodel;

  const AppTelInput({
    super.key,
    this.controller,
    this.errorText,
    this.label = 'Numéro de téléphone',
    this.onChanged,
    this.onCountryChanged,
    this.vmodel,
    this.readOnly = false,
  });
 
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        errorText: errorText,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.orange),
        ),
      ),
      initialCountryCode: 'CM',
      countries: countries.where((Country country) => ['CM', 'GA'].contains(country.code)).toList(),
      languageCode: 'fr',
      disableLengthCheck: true,
      controller: controller,
      onChanged: (PhoneNumber phone) {
        if (onChanged != null) {
          onChanged!(phone);
        } else if (vmodel != null) {
          vmodel!.value = phone.completeNumber;
        }
      },
      onCountryChanged: onCountryChanged,
      readOnly: readOnly,
    );
  } 
}