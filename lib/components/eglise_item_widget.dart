

import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';

import '../core/constants.dart';
import '../core/shared/modals.dart';
import 'items/hour_item.dart';

// ignore: must_be_immutable
class EgliseItemWidget extends StatelessWidget {
  EgliseItemWidget(
      {super.key, 
      required this.eglise, 
      required this.adresse,
      required this.hours,
      required this.date,
      });
  String eglise;
  String adresse;
  List hours ;
  String date ;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 3),
      padding: EdgeInsets.only(bottom:PADDING * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(PADDING * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async{
                    await Modals.showModalDetailEglise(
                      context, 
                      eglise: eglise, 
                      adresse: adresse, 
                      hours: hours,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${eglise}',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: greenColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: greenColor.withOpacity(0.1),
                            borderRadius: const BorderRadius.all(Radius.circular(50))),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${adresse}",
                  style: TextStyle(color: greenColor),
                ),
              ],
            ),
          ),
          
          SpGrid(
            spacing: PADDING*2,
            runSpacing: PADDING*2,
            crossAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              ...List.generate(
                hours.length, 
              (index) {
                return   SpGridItem(
                md: 2,
                sm: 3,
                xs: 4,
                child: HourItem(
                  hour: "${hours[index]['hour']}", 
                  press: () async{
                  await Modals.showModalDemandeMesse(
                    context, 
                    eglise: eglise, 
                    adresse: adresse, 
                    date: date, 
                    hour: hours[index]['hour'],
                  );
                },));
          
              })
          ]
          )
        ],
      ),
    );
  }
}

