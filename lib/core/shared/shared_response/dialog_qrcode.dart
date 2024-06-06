import 'package:flutter/material.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/core/constants.dart';

class DialogQrCodeDesktop extends StatelessWidget {
  const DialogQrCodeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 400, // Largeur de la boîte de dialogue
        child: Padding(
          padding: EdgeInsets.all(padding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: Image.asset("assets/images/logo.png")),
              SizedBox(height: padding * 2),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/images/Qrcode.png"),
              ),
              SizedBox(height: padding * 2),
              const Text(
                'Scannez ce code',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 2),
              Text(
                'Pour aider votre ami(e) à télécharger l’application,'
                'faites scanner ce code avec l’appareil photo de son téléphone.',
                style: TextStyle(color: blackColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 2),
              AppButtonWidget(
                label: "Merci",
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
