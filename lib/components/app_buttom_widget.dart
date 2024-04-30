import 'package:flutter/material.dart';

import '../core/constants.dart';

class AppButtomWidget extends StatelessWidget {
  const AppButtomWidget({
    super.key, 
   required this.press, 
    required this.label,
    this.labelColor = Colors.white,
    this.buttomColor = Colors.black
  });
  final Function()? press;
  final String label ;
  final dynamic labelColor ;
  final dynamic buttomColor ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: PADDING*1.5),
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(RADIUS*2)),
          color: buttomColor,
        ),
        child:  Text(
          label,
          style:  TextStyle(
              color: labelColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
