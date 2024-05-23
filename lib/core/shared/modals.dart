import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_adresse.dart';
import 'choice_offering.dart';
import 'demande_messe.dart';
import 'detail_eglise.dart';
import 'dialogQrCode.dart';
import 'dialog_successful.dart';

class Modals {
  static Future<dynamic> showModalDemandeMesse(
    BuildContext context, {
   
    required String time,
    required String hour,
    required dynamic data,
  }) {
    return showCupertinoModalPopup(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DemandeMesse(
          time: time,
          data: data, 
          hour: hour,
        );
      },
    );
  }

    static Future<dynamic> showModalDetailEglise(
    BuildContext context, {
    required dynamic data,
  }) {
    return showCupertinoModalPopup(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DetailEglise(
          data: data,
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
        return const ChoiceOffering();
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
        return const AddAdresse();
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
        return const DialogSuccessful();
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
        return const DialogQrCode();
      },
    );
  }
}
