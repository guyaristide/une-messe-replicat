import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_adresse.dart';
import 'choice_offering.dart';
import 'demande_messe.dart';
import 'dialogQrCode.dart';
import 'dialog_succssful.dart';

class Modals {
  static Future<dynamic> showModalDemandeMesse(
    BuildContext context, {
    required String eglise,
    required String adresse,
    required String date,
    required String hour,
  }) {
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

  static Future<dynamic> showModalChoiceOffering(
    BuildContext context,
    // { }
  ) {
    return showCupertinoModalPopup(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ChoiceOffering();
      },
    );
  }

  static Future<dynamic> showModalAddAdresse(
    BuildContext context,
    // { }
  ) {
    return showCupertinoModalPopup(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AddAdresse();
      },
    );
  }

  static Future<dynamic> showModalSuccessful(
    BuildContext context,
    // { }
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogSuccessful();
      },
    );
  }
  static Future<dynamic> showModalQrcode(
    BuildContext context,
    // { }
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogQrCode();
      },
    );
  }
}
