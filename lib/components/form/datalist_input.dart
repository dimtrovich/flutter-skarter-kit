import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:mindset/components/form/index.dart';

class AppDatalistInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorText;
  final Future<List<String>> Function()? fetcher;
  final String label;
  final void Function(String)? onSelected;
  final List<String>? options;
  final bool readOnly;
  final RxString? vmodel;

  const AppDatalistInput({
    super.key,
    this.controller,
    this.errorText,
    this.fetcher,
    required this.label,
    this.onSelected,
    this.options,
    this.readOnly = false,
    this.vmodel,
  });

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      onSelected: (String value) {
        if (onSelected != null) {
          onSelected!(value);
        } else if (vmodel != null) {
          vmodel!.value = value;
        }
        controller!.text = value;
      },
      controller: controller,
      builder: (context, controller, focusNode) => AppInput(
        controller: controller,
        errorText: errorText,
        focusNode: focusNode,
        label: label,
        readOnly: readOnly,
        vmodel: vmodel,
      ),
      suggestionsCallback: (value) async {
        if (value == '') {
          return List<String>.empty();
        }
        if (options != null) {
          return findSuggestion(options!, value);
        }
        if (fetcher != null) {
          List<String> list = await fetcher!();
          return findSuggestion(list, value);
        }
        return List<String>.empty();
      },
      itemBuilder: (context, suggestion) => ListTile(title: Text(suggestion)),
    );
  }

  List<String> findSuggestion(List<String> items, String value) {
    return items
        .where(
          (String item) => item.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
  }
}
