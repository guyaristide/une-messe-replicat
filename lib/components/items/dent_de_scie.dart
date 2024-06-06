import 'package:flutter/material.dart';

class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double step = 10; // Taille des dents de scie
    double halfStep = step / 2;

    // Commencer en haut à gauche
    path.moveTo(0, 0);

    // Dessiner les dents de scie vers la droite
    double xPos = 0.0;
    while (xPos < size.width) {
      path.lineTo(xPos + halfStep, 5); // Descendre
      path.lineTo(xPos + step, 0); // Monter
      xPos += step;
    }

    // Fermer le chemin
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
