import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'demande_messe.dart';

class Modals {
   static Future<dynamic> showModalDemandeMesse(
    BuildContext context,
    { 
      required String eglise,
   required String adresse,
   required String date,
   required String hour,
     }
 ) {
    return showCupertinoModalPopup(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DemandeMesse(
          eglise: eglise, 
          adresse: adresse, 
          date: date, 
          hour: hour,
          // order: order
          );
      },
    );
  }
}