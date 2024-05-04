import 'package:flutter/material.dart';

class CustomTooltip extends StatefulWidget {
  final String message;
  final Widget child;
  final dynamic textColor;

  CustomTooltip({super.key, 
    required this.message,
    required this.child,
     this.textColor = Colors.black,
  });

  @override
  _CustomTooltipState createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: widget.child,
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                 shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
                title: Text("${widget.message}",),
                titlePadding: EdgeInsets.all(10),
                titleTextStyle: TextStyle(color: widget.textColor,fontSize: 16,),
              );
            },
          );
        });
  }
}
