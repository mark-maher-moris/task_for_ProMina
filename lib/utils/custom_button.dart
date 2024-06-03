import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  CustomBox(
      {super.key,
      required this.background,
      required this.child,
      required this.onTap});
  Color background;
  Widget child;
  dynamic onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: const Color.fromARGB(255, 190, 190, 190))),
      ),
    );
  }
}
