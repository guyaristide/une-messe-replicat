import 'package:flutter/material.dart';

import '../core/constants.dart';

// ignore: must_be_immutable
class Formfield extends StatelessWidget {
   Formfield({
    super.key,
    required this.hintText,
     this.icon,
    this.maxline,
    this.border = 12,
    this.borderHeight = 26,
    this.keyboard,
    this.controller,
    this.press,
    this.isObscure = false,
  });
String  hintText ;
Widget? icon;
int? maxline;
double? border;
double? borderHeight;
TextInputType? keyboard;
 TextEditingController? controller;
 bool isObscure ;
 final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          obscureText: isObscure,
          controller: controller,
          onTap: press,
          keyboardType: keyboard,
          maxLines: maxline,
          decoration: InputDecoration(
            hintText: hintText,
          suffixIcon: icon, 
          ),
        ),
        Positioned(
          left: 0,
          bottom: border,
          child: Center(
            child: Container(
              height: borderHeight,
              width: 2,
              color: primaryColor,
            ),
          ))
      ],
    );
  }
}