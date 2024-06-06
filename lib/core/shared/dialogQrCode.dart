import 'package:flutter/material.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import '../constants.dart';

class DialogQrCode extends StatelessWidget {
  const DialogQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: Container(
        // width: size.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius * 2)
          ),
          color: Colors.white, // Couleur du contenu rose
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: padding * 2, horizontal: padding * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/logo.png")),
              SizedBox(
                height: padding * 2,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/images/Qrcode.png")),
              SizedBox(
                height: padding * 2,
              ),

              const Text(
                'Scannez ce code',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpaceGrotesk',
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: padding * 2,
              ),
              const Text(
                'Pour l’aider à télécharger l’application,'
                'faîtes scanner ce code à votre ami(e) grâce à l’appareil photo de son téléphone',
                style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                  color: Color(0xff444B59),
                  fontWeight: FontWeight.bold,
                  ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: padding * 2,
              ),
              AppButtonWidget(
                  press: () {
                    Navigator.pop(context);
                  },
                  label: "Merci")
            ],
          ),
        ),
      ),
    );
  }
}
