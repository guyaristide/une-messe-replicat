import 'package:flutter/material.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/core/constants.dart';

class DialogSuccessfulDesktop extends StatelessWidget {
  const DialogSuccessfulDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: indigoColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius * 2),
      ),
      child: SizedBox(
        width: 400, // Largeur de la boîte de dialogue
        height: 500,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding * 3, horizontal: padding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/3d-render-pray-sorry-gesture-with-black-hands 1.png"),
              SizedBox(height: padding * 3),
              const Text(
                'FÉLICITATIONS !',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 3),
              Text(
                'Votre demande de messe est envoyée !',
                style: TextStyle(color: lightndigoColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 3),
              AppButtonWidget(
                label: "En union de prières !",
                press: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
