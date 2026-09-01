import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({super.key, this.onTap, this.title});
  final void Function()? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: const Color(0xffffffff),
          border: Border.all(width: 3.0, color: const Color(0xFF444444)),
        ),
        child: Center(
          child: Text(
            "$title",
            style: const TextStyle(
              color: Color(0xff707070),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
