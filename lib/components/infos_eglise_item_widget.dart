

import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';

import '../core/constants.dart';
import '../core/shared/modals.dart';

// ignore: must_be_immutable
class InfosEgliseItemWidget extends StatelessWidget {
  InfosEgliseItemWidget(
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
      margin: EdgeInsets.only(bottom: 3),
      padding: EdgeInsets.only(bottom:PADDING * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(PADDING * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    SizedBox(
                      width: PADDING,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: greenColor.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: greenColor,
                      ),
                    ),
                  ],
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
                child: GestureDetector(
                  onTap: () async{
                    await Modals.showModalDemandeMesse(
                      context, 
                      eglise: eglise, 
                      adresse: adresse, 
                      date: date, 
                      hour: hours[index]['hour'],
                      
                    );
                    // Modals.showModalAddAdresse(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: PADDING*1.5),
                    decoration: BoxDecoration(
                        color: greenColor.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(RADIUS))),
                        child: Text("${hours[index]['hour']}",
                        style: TextStyle(fontWeight: FontWeight.bold,color: greenColor),
                        textAlign: TextAlign.center,),
                  ),
                ));
          
              })
          ]
          )
        ],
      ),
    );
  }
}
