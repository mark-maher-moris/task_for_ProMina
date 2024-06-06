import 'dart:ui';

import 'package:flutter/material.dart';
import '../resources/values_manager.dart';

class CustomBox extends StatelessWidget {
  CustomBox(
      {super.key,
      required this.backgroundColor,
      required this.child,
      required this.onTap,
      required this.blury});
  Color backgroundColor;
  Widget child;
  dynamic onTap;
  bool blury ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s40),
        child: Container(
          child: Stack(
            children: [
             if (blury)
              Positioned.fill(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Colors.white.withOpacity(0.3),
                ),
              )),
              child,
            ],
          ),
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: Color.fromARGB(255, 226, 226, 226))),
        ),
      ),
    );
  }
}
