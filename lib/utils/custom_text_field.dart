import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/values_manager.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.keyboardType,
      required this.hint});
  String hint;
  TextInputType keyboardType;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CupertinoTextField(
        controller: controller,
        placeholder: hint,
        padding: EdgeInsets.all(AppPadding.p8),
        placeholderStyle: const TextStyle(
            fontSize: AppSize.s14, color: Color.fromARGB(255, 107, 107, 107)),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s18)),
          border: Border(
            bottom: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
