import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/constants.dart';

// ignore: must_be_immutable
class ButtomNavigationWidget extends StatefulWidget {
  const ButtomNavigationWidget({
    super.key,
    required this.label,
    required this.iconPath,
    required this.indexSelected,
    required this.currentIndex,
  });

  final String label;
  final String iconPath; // Change to String to hold SVG path
  final int indexSelected;
  final int currentIndex;

  @override
  State<ButtomNavigationWidget> createState() => _ButtomNavigationWidgetState();
}

class _ButtomNavigationWidgetState extends State<ButtomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    // Obtenir la largeur de l'écran
    double screenWidth = MediaQuery.of(context).size.width;

    double imageSize;
    if (screenWidth < 500) {
      // Pour les écrans de petite taille
      imageSize = 15.0;
    } else if (screenWidth < 1100) {
      // Pour les écrans de grande taille
      imageSize = 20.0;
    } else {
      imageSize = 25.0;
    }
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SvgPicture.asset(
            widget.iconPath,
            // ignore: deprecated_member_use
            color: widget.currentIndex == widget.indexSelected ? primaryColor : greenColor,
            width: imageSize, // Set the desired width
            height: imageSize, // Set the desired height
          ),
          Text(
            widget.label,
            style: TextStyle(
              color: widget.currentIndex == widget.indexSelected ? primaryColor : greenColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'SpaceGrotesk',
            ),
          ),
        ],
      ),
    );
  }
}
