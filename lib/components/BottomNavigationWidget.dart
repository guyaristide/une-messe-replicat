import 'package:flutter/material.dart';

import '../core/constants.dart';

// ignore: must_be_immutable
class ButtomNavigationWidget extends StatefulWidget {
   ButtomNavigationWidget({super.key,
  required this.label,
  required this.icon,
   required this.indexSelected,
   required this.currentIndex,
  });
 final String label;
  IconData? icon;
  final int indexSelected;
  final int currentIndex;
  

  @override
  State<ButtomNavigationWidget> createState() => _ButtomNavigationWidgetState();
}

class _ButtomNavigationWidgetState extends State<ButtomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Icon(widget.icon,color: widget.currentIndex == widget.indexSelected ? primaryColor : greenColor),
          Text("${widget.label}",
          style: TextStyle(
            color: widget.currentIndex == widget.indexSelected ? primaryColor : greenColor
          ),
          )
        ],
      ),
    );
  }
}