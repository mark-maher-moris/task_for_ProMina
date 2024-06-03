import 'dart:ui';

import 'package:flutter/material.dart';
import '../resources/values_manager.dart';

class CustomBox extends StatelessWidget {
  CustomBox(
      {super.key,
      required this.backgroundColor,
      required this.child,
      required this.onTap});
  Color backgroundColor;
  Widget child;
  dynamic onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Stack(
          children: [
            child,
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: Container(
                color: Colors.white.withOpacity(0.5),
              ),
            )),
          ],
        ),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppSize.s12),
            border:
                Border.all(color: const Color.fromARGB(255, 190, 190, 190))),
      ),
    );
  }
}
