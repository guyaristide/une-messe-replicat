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
        padding: EdgeInsets.symmetric(vertical: PADDING*1.5),
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(RADIUS*2)),
          color: Colors.black,
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
