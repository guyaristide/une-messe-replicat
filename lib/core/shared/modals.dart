import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:une_messe/core/shared/dialogQrCode.dart';
import 'package:une_messe/core/shared/dialog_successful.dart';
import 'package:une_messe/core/shared/shared_response/add_adresse_desktop.dart';
import 'package:une_messe/core/shared/shared_response/choice_offering_desktop.dart';
import 'package:une_messe/core/shared/shared_response/demande_messe_desktop.dart';
import 'package:une_messe/core/shared/shared_response/detail_eglise_desktop.dart';
import 'package:une_messe/core/shared/shared_response/dialog_qrcode.dart';
import 'package:une_messe/core/shared/shared_response/dialog_successful_desktop.dart';
import 'add_adresse.dart';
import 'choice_offering.dart';
import 'demande_messe.dart';
import 'detail_eglise.dart';

class Modals {
  static Future<dynamic> showModalDemandeMesse(BuildContext context, {  
    required String time,
    required String hour,
    required dynamic data,
  }) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 500) {
              return DemandeMesse(
                time: time,
                data: data, 
                hour: hour,
              );
            } else if (constraints.maxWidth < 1100){
              return DemandeMesse(
                time: time,
                data: data, 
                hour: hour,
              );
            } else {
                return DemandeMesseDesktop(
                  time: time, 
                  data: data, 
                  hour: hour,
                );
          }
        }
      );
    },
  );
}


    static Future<dynamic> showModalDetailEglise(BuildContext context, {required data}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 500) {
              return DetailEglise(data: data);
            } else if (constraints.maxWidth < 1100){
                return DetailEglise(data: data);
            } else {
                return DetailEgliseDesktop(data: data);
            }
          },
        );
      },
    ); 
}

  static Future<dynamic> showModalChoiceOffering(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 500) {
              return const ChoiceOffering();
            } else if (constraints.maxWidth < 1100){
                return const ChoiceOffering();
            } else {
                return const ChoiceOfferingDesktop();
            }
          },
        );
      },
    );
  }


  static Future<dynamic> showModalAddAdresse(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 500) {
              return const AddAdresse();
            } else if (constraints.maxWidth < 1100) {
              return const AddAdresse();
            } else {
              return const AddAdresseDesktop();
            }
          },
        );
      },
    );
  }

  static Future<dynamic> showModalSuccessful(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 500) {
              return const DialogSuccessful();
            } else if (constraints.maxWidth < 1100){
              return const DialogSuccessful();
            } else {
                return const DialogSuccessfulDesktop();
            }
          },
        );
      },
    );
  }
  static Future<dynamic> showModalQrcode(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 500) {
              return const DialogQrCode();
            } else if (constraints.maxWidth < 1100){
              return const DialogQrCode();
            } else {
                return const DialogQrCodeDesktop();
            }
          },
        );
      },
    ); 
  }
}