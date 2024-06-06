import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';  // Import de flutter_svg
import 'package:une_messe/components/app_buttom_widget.dart';
import '../constants.dart';

class DialogSuccessful extends StatelessWidget {
  const DialogSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: indigoColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius * 2),
      ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(radius * 20),
            bottom: Radius.circular(radius * 2),
          ),
          color: pinkColor, // Couleur du contenu rose
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding * 3, horizontal: padding * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topLeft,
                children: [
                  Positioned(
                    top: -31,  // Modifier cette valeur pour déplacer verticalement
                    left: -114,   // Modifier cette valeur pour déplacer horizontalement
                    child: SvgPicture.asset(
                      "assets/images/3d-render-pray-sorry-gesture.svg", 
                      height: 210, 
                    ),
                  ),
                  Image.asset(
                    "assets/images/3d-render-pray-sorry-gesture-with-black-hands 1.png", 
                    height: 100,
                  ),
                ],
              ),
              SizedBox(height: padding * 10),
              const Text(
                'FÉLICITATIONS !',
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpaceGrotesk',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 3),
              Text(
                'Votre demande de messe est envoyée !',
                style: TextStyle(
                  color: lightndigoColor, 
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpaceGrotesk',
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 3),
              AppButtonWidget(
                press: () {
                  Navigator.pop(context);
                },
                label: "En union de prières !",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
