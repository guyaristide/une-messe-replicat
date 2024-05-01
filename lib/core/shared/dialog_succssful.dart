import 'package:flutter/material.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import '../constants.dart';

class DialogSuccessful extends StatelessWidget {
  const DialogSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: indigoColor, 
      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(RADIUS*2),
              ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        // width: size.width*0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(RADIUS * 20),
            bottom: Radius.circular(RADIUS * 2)
          ),
          color: pinkColor, // Couleur du contenu rose
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: PADDING*3,horizontal: PADDING*2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/3d-render-pray-sorry-gesture.png")),
              SizedBox(height: PADDING*3,),
              const Text(
                'FÉLICITATIONS !',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: PADDING*3,),
               Text(
                'Votre demande de messe est envoyée ! !',
                style: TextStyle(color: LightndigoColor,fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center,
              ),
              SizedBox(height: PADDING*3,),
              AppButtomWidget(
                press: (){
                  Navigator.pop(context);
                }, 
                label: "En union de prières !")
            ],
          ),
        ),
      ),
    );
  }
}
