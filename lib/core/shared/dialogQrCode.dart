import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import '../constants.dart';

class DialogQrCode extends StatelessWidget {
  const DialogQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: size.width * 0.7,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(RADIUS * 2)
          ),
          color: Colors.white, // Couleur du contenu rose
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: PADDING * 2, horizontal: PADDING * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/logo.png")),
              SizedBox(
                height: PADDING * 2,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/images/Qrcode.png")),
              SizedBox(
                height: PADDING * 2,
              ),

              const Text(
                'Scannez ce code',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: PADDING * 2,
              ),
              Text(
                'Pour l’aider à télécharger l’application,'
                'faîtes scanner ce code à votre ami(e) grâce à l’appareil photo de son téléphone',
                style: TextStyle(color: blackColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: PADDING * 2,
              ),
              AppButtomWidget(
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
