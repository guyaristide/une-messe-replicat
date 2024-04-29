import 'package:flutter/material.dart';

import '../core/constants.dart';

class AppButtomWidget extends StatelessWidget {
  const AppButtomWidget({
    super.key, 
   required this.press, 
    required this.label,
  });
  final Function()? press;
  final String label ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: PADDING),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: primaryColor,
        ),
        child:  Text(
          label,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
