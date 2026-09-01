import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDropdownField extends StatelessWidget {
  final String? errorText;
  final String label;
  final List<dynamic> items;
  final List<DropdownMenuItem<dynamic>> Function(List<dynamic>)? itemsBuilder;
  final void Function(dynamic)? onChanged;
  final Rx? vmodel;

  const AppDropdownField({
    super.key,
    this.errorText,
    required this.label,
    required this.items,
    this.itemsBuilder,
    this.onChanged,
    this.vmodel,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      items: _buildItems(),
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        } else if (vmodel != null) {
          vmodel!.value = value;
        }
      },
      dropdownColor: Colors.white,
      initialValue: vmodel!.value,
    );
  }

  List<DropdownMenuItem<dynamic>> _buildItems() {
    if (itemsBuilder != null) {
      return itemsBuilder!(items);
    }

    return items.map((item) {
      String value = '';
      String text = '';

      if (item is String) {
        value = item;
        text = item;
      } else if (item is Map) {
        value = item['value']!;
        text = item['text']!;
      }

      return DropdownMenuItem(value: value, child: Text(text));
    }).toList();
  }
}
