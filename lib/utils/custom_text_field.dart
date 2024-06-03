import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key ,required this.controller,required this.keyboardType,required this.hint});
String hint; 
TextInputType keyboardType;
TextEditingController? controller; 

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller ,
      placeholder: hint,
      padding: const EdgeInsets.all(10),
      placeholderStyle: const TextStyle(color: Color.fromARGB(255, 190, 190, 190)),
      style: const TextStyle(color: Color.fromARGB(255, 190, 190, 190)),
      cursorColor: const Color.fromARGB(255, 190, 190, 190),

      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 190, 190, 190),
          ),
        ),  
      ),keyboardType:keyboardType ,
      
    );

  }
}