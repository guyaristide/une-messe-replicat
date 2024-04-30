import 'package:flutter/material.dart';
import 'package:une_messe/core/constants.dart';

// ignore: must_be_immutable
class Formfield extends StatelessWidget {
  Formfield({
    super.key,
    required this.hintText,
    required this.labelText,
    this.icon,
    this.maxline,
    this.border = 12,
    this.borderHeight = 26,
    this.keyboard,
    this.controller,
    this.press,
    this.isObscure = false,
  });
  String hintText;
  String labelText;
  Widget? icon;
  int? maxline;
  double? border;
  double? borderHeight;
  TextInputType? keyboard;
  TextEditingController? controller;
  bool isObscure;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: controller,
      onTap: press,
      keyboardType: keyboard,
      maxLines: maxline,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: blackColor,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: icon,
      ),
    );
  }
}
